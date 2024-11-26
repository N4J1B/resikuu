import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../data/service/api_service.dart';
import '../data/model/custom_exception.dart';
import '../data/model/resi.dart';
import '../router/route_name.dart';
import '../page/widgets/error_dialog.dart';

class HomeC extends GetxController {
  final ApiService apiserve;

  HomeC({required this.apiserve});

  late Resi response;
  final TextEditingController resiC = TextEditingController();
  final TextEditingController kurirC = TextEditingController();
  final resiF = FocusNode();
  var kurir = "".obs;
  final androidId = GetStorage().read("device").toString();

  Future<void> addRecent(String resi, String kurir, String kodekurir) async {
    final deviceRef =
        FirebaseFirestore.instance.collection('users').doc(androidId);
    final recentSearchesRef = deviceRef.collection('recents');

    final querySnapshot = await recentSearchesRef
        .where('resi', isEqualTo: resi)
        .where('kurir', isEqualTo: kurir)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await querySnapshot.docs[0].reference.update({
        "timestamp": FieldValue.serverTimestamp(),
        "kurir": kurir, // Opsional: Perbarui data lainnya jika diperlukan
        "kodekurir": kodekurir,
      });
    } else {
      // Jika data dengan resi tersebut tidak ada, kita tambahkan data baru
      await recentSearchesRef.add({
        "resi": resi,
        "kurir": kurir,
        "kodekurir": kodekurir,
        "timestamp": FieldValue.serverTimestamp(),
      });
    }
  }

  Stream<List<Map<String, dynamic>>> getRecent() {
    final deviceRef =
        FirebaseFirestore.instance.collection('users').doc(androidId);
    final recentSearchesRef =
        deviceRef.collection('recents').orderBy('timestamp', descending: true);

    return recentSearchesRef
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Future<void> deleteRecentSearch(String resi, String kurir) async {
    final deviceRef =
        FirebaseFirestore.instance.collection('users').doc(androidId);
    final recentSearchesRef = deviceRef.collection('recents');

    final querySnapshot = await recentSearchesRef
        .where('resi', isEqualTo: resi)
        .where("kurir", isEqualTo: kurir)
        .get();

    await querySnapshot.docs[0].reference.delete();
  }

  Future<void> deleteAllRecents() async {
    final deviceRef =
        FirebaseFirestore.instance.collection('users').doc(androidId);
    final recentSearchesRef = deviceRef.collection('recents');

    final snapshot = await recentSearchesRef.get();

    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  void ontap(String kurirs, String kodekurir, String resi) {
    kurirC.text = kurirs;
    resiC.text = resi;
    kurir.value = kodekurir;
  }

  void cekResi() async {
    resiF.unfocus();
    Get.dialog(
      AlertDialog(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Loading'),
          ],
        ),
        content: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircularProgressIndicator(),
          ],
        )),
      ),
      useSafeArea: true,
    );
    try {
      response = await apiserve.getResi(kurir.value, resiC.text);
      addRecent(resiC.text, kurirC.text, kurir.value);
      Get.back();
      Get.toNamed(RouteName.detailcek, arguments: [
        response.data.detail,
        response.data.history,
        response.data.summary,
        kurir.value
      ]);
    } on CustomException catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(e: e));
    }
  }

  void scanner() async {
    String? res = await SimpleBarcodeScanner.scanBarcode(
      Get.context!,
      barcodeAppBar: const BarcodeAppBar(
        appBarTitle: 'Scan Barcode Resi',
        centerTitle: false,
        enableBackButton: true,
        backButtonIcon: Icon(Icons.arrow_back_ios),
      ),
      isShowFlashIcon: true,
      delayMillis: 0,
      cameraFace: CameraFace.back,
      cancelButtonText: "Batal",
      scanType: ScanType.barcode,
    );
    resiC.text = res == "-1" ? resiC.text : res!;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    resiC.dispose();
    kurirC.dispose();
    super.onClose();
  }
}
