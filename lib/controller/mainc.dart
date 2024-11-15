import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../page/bookmark_screen.dart';
import '../page/home_screen.dart';
import '../page/ongkir_screen.dart';

class MainC extends GetxController {
  var currentIndex = 0.obs;
  final pagec = PageController();
  var pops = true;

  Future<bool> showExitConfirmation(
      bool stopDefaultButtonEvent, RouteInfo info) async {
    if (info.ifRouteChanged(Get.context!)) return false;
    return await Get.dialog(
          barrierDismissible: false,
          AlertDialog(
            title: Text("Konfirmasi"),
            content: Text("Apakah Anda ingin keluar dari aplikasi?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Tidak"),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  pops = false;
                },
                child: Text("Ya"),
              ),
            ],
          ),
        ) ??
        pops;
  }

  final List<Widget> pages = [
    HomeScreen(),
    OngkirScreen(),
    BookmarkScreen(),
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    BackButtonInterceptor.add(showExitConfirmation, context: Get.context);
    super.onInit();
  }

  @override
  void onClose() {
    pagec.dispose();
    BackButtonInterceptor.remove(showExitConfirmation);
    super.onClose();
  }
}
