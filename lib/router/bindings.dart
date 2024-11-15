import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:resikuu/controller/detailongkirc.dart';
import 'package:resikuu/controller/detailresic.dart';
import 'package:resikuu/data/service/local_service.dart';

import '../controller/bookmarkc.dart';
import '../controller/mainc.dart';
import '../controller/homec.dart';
import '../controller/ongkirc.dart';
import '../data/service/api_service.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalService>(() => LocalService());
    Get.lazyPut<ApiService>(() => ApiService(dio: Dio()));
    Get.lazyPut<MainC>(() => MainC());
    Get.lazyPut<HomeC>(() => HomeC(apiserve: Get.find()));
    Get.lazyPut<OngkirC>(() => OngkirC(apiserve: Get.find()));
    Get.lazyPut<BookmarkC>(() => BookmarkC(apiserve: Get.find()));
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeC>(() => HomeC(apiserve: Get.find()));
  }
}

class OngkirBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OngkirC>(() => OngkirC(apiserve: Get.find()));
  }
}

class BookmarkBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookmarkC>(
        () => BookmarkC(apiserve: Get.find()));
  }
}

class DetailResiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailresiC>(() => DetailresiC());
  }
}

class DetailOngkirBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailOngkirC>(() => DetailOngkirC());
  }
}
