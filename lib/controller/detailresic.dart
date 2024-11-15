import 'package:get/get.dart';
import 'package:resikuu/data/model/resi.dart';

class DetailresiC extends GetxController {
  final Detail detail = Get.arguments[0];
  final List<History> history = Get.arguments[1];
  final Summary summary = Get.arguments[2];
  final String kurirkode = Get.arguments[3];
  final statusBook = false.obs;
}
