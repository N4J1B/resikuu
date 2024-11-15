import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'router/bindings.dart';
import 'router/route_name.dart';
import 'router/app_page.dart';
import 'page/main_screen.dart';

Future<void> main() async {
  //local storage
  await GetStorage.init();

  runApp(
      MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      initialRoute: RouteName.main,
      title: "ResiKuu",
      initialBinding: RootBinding(),
      getPages: AppPage.pages,
      home: MainScreen(),
    );
  }
}
