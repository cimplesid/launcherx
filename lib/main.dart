import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:launcherx/screens/home.dart';

import 'controllers/apps.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
