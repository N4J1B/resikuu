import 'package:get/get.dart';
import 'package:resikuu/data/model/ongkir2.dart';

class DetailOngkirC extends GetxController {
  final data = Get.arguments[0] as List<DataOngkir>;
  final origin = Get.arguments[1] as Destination;
  final destination = Get.arguments[2] as Destination;
  final berat = Get.arguments[3] as String;
}
