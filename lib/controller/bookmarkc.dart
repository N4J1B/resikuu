import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/model/resi.dart';
import '../data/service/api_service.dart';
import '../router/route_name.dart';
import '../data/model/custom_exception.dart';
import '../page/widgets/error_dialog.dart';

class BookmarkC extends GetxController {
  final ApiService apiserve;

  BookmarkC({required this.apiserve});

  final androidId = GetStorage().read("device").toString();
  late Resi response;

  Future<void> addBookmark(String resi, String kurir, String kodekurir) async {
    final deviceRef =
        FirebaseFirestore.instance.collection('users').doc(androidId);
    final bookmarksRef = deviceRef.collection('bookmarks');

    final querySnapshot = await bookmarksRef
        .where('resi', isEqualTo: resi)
        .where('kurir', isEqualTo: kurir)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
    } else {
      await bookmarksRef.add({
        "resi": resi,
        "kurir": kurir,
        "kodekurir": kodekurir,
        "timestamp": FieldValue.serverTimestamp(),
      });
    }
  }

  Stream<List<Map<String, dynamic>>> getBookmark() {
    final deviceRef =
        FirebaseFirestore.instance.collection('users').doc(androidId);
    final bookmarksRef = deviceRef
        .collection('bookmarks')
        .orderBy('timestamp', descending: true);

    return bookmarksRef
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Future<void> deleteBookmark(String resi, String kurir) async {
    final deviceRef =
        FirebaseFirestore.instance.collection('users').doc(androidId);
    final bookmarksRef = deviceRef.collection('bookmarks');

    final querySnapshot = await bookmarksRef
        .where('resi', isEqualTo: resi)
        .where("kurir", isEqualTo: kurir)
        .get();

    await querySnapshot.docs[0].reference.delete();
  }

  Future<bool> cekstatus(String resi, String kurir) async {
    final deviceRef =
        FirebaseFirestore.instance.collection('users').doc(androidId);
    final data = await deviceRef
        .collection("bookmarks")
        .where("resi", isEqualTo: resi)
        .where("kurir", isEqualTo: kurir)
        .get();
    return data.docs.isNotEmpty;
  }

  Future<void> onclick(String resi, String kurir) async {
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
          ),
        ),
      ),
      useSafeArea: true,
    );
    try {
      response = await apiserve.getResi(kurir, resi);
      Get.back();
      Get.toNamed(RouteName.detailcek, arguments: [
        response.data.detail,
        response.data.history,
        response.data.summary,
        kurir
      ]);
    } on CustomException catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(e: e));
    }
  }
}
