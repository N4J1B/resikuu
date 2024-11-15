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
  final box = GetStorage();
  var bookmarkList = [].obs;
  late Resi response;

  Future<void> addAndStoreBookmark(
      String resi, String kurir, String kodekurir) async {
    final Map storageMap = {};

    storageMap["resi"] = resi;
    storageMap["kurir"] = kurir;
    storageMap["kodekurir"] = kodekurir;

    final existingIndex = bookmarkList.indexWhere(
        (bookmark) => bookmark["resi"] == resi && bookmark["kurir"] == kurir);

    if (existingIndex != -1) {
      bookmarkList.removeAt(existingIndex);
    } else {
      if (bookmarkList.length >= 10) {
        bookmarkList.removeAt(0);
      }
    }
    bookmarkList.add(storageMap);

    await box.write('bookmark', bookmarkList);
  }

  void remove(String resi, String kurir) async {
    bookmarkList.removeWhere(
        (bookmark) => bookmark["resi"] == resi && bookmark["kurir"] == kurir);

    box.write('bookmark', bookmarkList);
  }

  void restoreRecents() {
    bookmarkList.value = (box.read('bookmark') ?? []);
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

  @override
  void onInit() async {
    restoreRecents();
    super.onInit();
  }
}
