import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalService extends GetxService {
  GetStorage box = GetStorage();
  var bookmarkList = [].obs;

  Future<void> addAndStoreBookmark(String resi, String kurir, String kurirkode) async {
    final storageMap = {};

    storageMap["resi"] = resi;
    storageMap["kurir"] = kurir;
    storageMap["kodekurir"] = kurirkode;

    if (!bookmarkList.any(
        (bookmark) => bookmark["resi"] == resi && bookmark["kurir"] == kurir && bookmark["kodekurir"] == kurirkode)) {
      bookmarkList.add(storageMap);
    }

    await box.write('bookmark', bookmarkList);
  }

  List restoreBookmark() {
    return box.read('bookmark') ?? [];
  }

  void deleteBookmark(String resi, String kurir) async {
    bookmarkList.removeWhere(
        (bookmark) => bookmark["resi"] == resi && bookmark["kurir"] == kurir);

    box.write('bookmark', bookmarkList);
  }

  bool isBookmarked(String resi, String kurir) {
    return bookmarkList.any(
        (bookmark) => bookmark["resi"] == resi && bookmark["kurir"] == kurir);
  }

  @override
  void onInit() {
    super.onInit();
    bookmarkList.value = restoreBookmark();
  }
}
