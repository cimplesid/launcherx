import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:launcherx/Utils/swipe_detector.dart';
import 'package:launcherx/controllers/apps.dart';
import 'package:launcherx/screens/all_apps.dart';

class HomeScreen extends StatelessWidget {
  final wall = Get.put(MyApps());
  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
      ondouble: () {
        LauncherAssist.launchApp('com.android.contacts');
      },
      onSwipeUp: () => Get.to(AppsScreeen()),
      child: Obx(() => Image.memory(
            wall.wallpaper.value,
            fit: BoxFit.cover,
          )),
    );
  }
}
