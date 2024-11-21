import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';
import 'router/bindings.dart';
import 'router/route_name.dart';
import 'router/app_page.dart';
import 'page/main_screen.dart';

Future<void> main() async {
  //local storage
  await GetStorage.init();
  final box = GetStorage();
  final android = await DeviceInfoPlugin().androidInfo;
  box.write("device", android.id);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

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
