import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resikuu/data/model/resi.dart';
import 'package:resikuu/data/service/api_service.dart';
import 'package:resikuu/page/widgets/error_dialog.dart';
import 'package:resikuu/router/route_name.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../data/model/custom_exception.dart';

class HomeC extends GetxController {
  final ApiService apiserve;

  HomeC({required this.apiserve});

  final box = GetStorage();
  late Resi response;
  late TextEditingController resiC;
  late TextEditingController kurirC;
  late FocusNode resiF;
  var kurir = "".obs;

  final storageList = [].obs;

  Future<void> addAndStoreRecent(String resi, String kurir, String kodekurir) async {
    final Map storageMap = {};

    storageMap["resi"] = resi;
    storageMap["kurir"] = kurir;
    storageMap["kodekurir"] = kodekurir;

    final existingIndex = storageList.indexWhere(
        (bookmark) => bookmark["resi"] == resi && bookmark["kurir"] == kurir);

    if (existingIndex != -1) {
      storageList.removeAt(existingIndex);
    } else {
      if (storageList.length >= 10) {
        storageList.removeAt(0);
      }
    }
    storageList.add(storageMap);

    await box.write('recent', storageList);
  }

  void deleteRecent(String resi, String kurir) async {
    storageList.removeWhere(
        (bookmark) => bookmark["resi"] == resi && bookmark["kurir"] == kurir);

    box.write('recent', storageList);
  }

  void restoreRecents() {
    storageList.value = (box.read('recent') ?? []);
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
      Get.back();
      addAndStoreRecent(resiC.text, kurirC.text, kurir.value);
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
  void onInit() {
    super.onInit();
    resiC = TextEditingController();
    kurirC = TextEditingController();
    resiF = FocusNode();
    restoreRecents();
  }

  @override
  void onClose() {
    resiC.dispose();
    kurirC.dispose();
    super.onClose();
  }
}
