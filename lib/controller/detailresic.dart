import 'package:get/get.dart';
import 'package:resikuu/controller/bookmarkc.dart';
import 'package:resikuu/data/model/resi.dart';

class DetailresiC extends GetxController {
  final b = Get.find<BookmarkC>();

  final Detail detail = Get.arguments[0];
  final List<History> history = Get.arguments[1];
  final Summary summary = Get.arguments[2];
  final String kurirkode = Get.arguments[3];
  final statusBook = false.obs;

  void change() {
    statusBook.toggle();
    if (statusBook.value) {
      b.addAndStoreBookmark(summary.awb, summary.courier, kurirkode);
    } else {
      b.remove(summary.awb, summary.courier);
    }
  }

  @override
  void onInit() {
    statusBook.value = b.bookmarkList.any((bookmark) =>
        bookmark["resi"] == summary.awb &&
        bookmark["kurir"] == summary.courier);
    super.onInit();
  }
}
