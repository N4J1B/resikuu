import 'package:get/get.dart';

import 'bindings.dart';
import 'route_name.dart';
import '../page/main_screen.dart';
import '../page/ongkir_detail.dart';
import '../page/resi_detail.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.main,
      page: () => MainScreen(),
      binding: RootBinding(),
    ),
    GetPage(
      name: RouteName.detailcek,
      page: () => ResiDetail(),
      binding: DetailResiBinding(),
    ),
    GetPage(
      name: RouteName.detailongkir,
      page: () => OngkirDetail(),
      binding: DetailOngkirBinding(),
    ),
  ];
}
