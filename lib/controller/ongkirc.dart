import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resikuu/data/model/city.dart';
import 'package:resikuu/data/model/ongkir2.dart';
import 'package:resikuu/data/service/api_service.dart';
import 'package:resikuu/page/widgets/loading_dialog.dart';

import '../data/model/custom_exception.dart';
import '../page/widgets/error_dialog.dart';
import '../router/route_name.dart';

class OngkirC extends GetxController {
  final ApiService apiserve;

  OngkirC({required this.apiserve});

  late TextEditingController beratC;
  late TextEditingController asalC;
  late TextEditingController tujuanC;
  late FocusNode beratF;
  late FocusNode asalF;
  late FocusNode tujuanF;
  var asalid = "".obs;
  var tujuanid = "".obs;
  late Ongkir2 response2;
  late City response;
  var isLoading = false.obs;
  var isAsalEmpty = true.obs;
  var isTujuanEmpty = true.obs;

  void onselectedasal(Data city) {
    asalC.text = city.name;
    asalid.value = city.id;
  }

  void onselectedtujuan(Data city) {
    tujuanC.text = city.name;
    tujuanid.value = city.id;
  }

  Future<List<Data>> onsearch(String search) async {
    if (search.isEmpty) {
      return [];
    }
    final response = await apiserve.getCity(search);
    return response.areaData;
  }

  void cekOngkir() async {
    FocusScope.of(Get.context!).unfocus();
    asalF.unfocus();
    tujuanF.unfocus();
    beratF.unfocus();
    Get.dialog(
      LoadingDialog(),
      useSafeArea: true,
      barrierDismissible: true,
    );
    try {
      response2 = await apiserve.getOngkir2(
          asalid.value, tujuanid.value, int.parse(beratC.text));
      Get.back();
      Get.toNamed(RouteName.detailongkir, arguments: [
        response2.data,
        response2.origin,
        response2.destination,
        beratC.text
      ]);
    } on CustomException catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(e: e));
    }
  }

  void clearasal() {
    asalC.text = "";
  }

  void cleartujuan() {
    tujuanC.text = "";
  }

  @override
  void onInit() {
    super.onInit();
    asalC = TextEditingController();
    tujuanC = TextEditingController();
    beratC = TextEditingController(text: "1000");
    asalF = FocusNode();
    tujuanF = FocusNode();
    beratF = FocusNode();
    asalC.addListener(() {
      isAsalEmpty.value = asalC.text.isEmpty;
    });
    tujuanC.addListener(() {
      isTujuanEmpty.value = tujuanC.text.isEmpty;
    });
  }

  @override
  void onClose() {
    super.onClose();
    asalC.dispose();
    tujuanC.dispose();
    beratC.dispose();
  }
}
