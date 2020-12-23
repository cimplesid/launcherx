import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:launcherx/screens/home.dart';

import 'controllers/apps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(GetMaterialApp(
    home: HomeScreen(),
    onInit: () {
      Get.put(MyApps());
    },
    onDispose: () {
      Get.delete<MyApps>();
    },
  ));
}
