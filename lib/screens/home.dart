import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launcherx/Utils/swipe_detector.dart';
import 'package:launcherx/controllers/apps.dart';
import 'package:launcherx/controllers/col_button.dart';
import 'package:launcherx/controllers/icon_size_controller.dart';
import 'package:launcherx/screens/all_apps.dart';
import 'package:launcherx/screens/settings.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  final wall = Get.put(MyApps());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SwipeDetector(
            ondouble: () {
              launch('tel:');
            },
            onPress: () => wall.change(false),
            longpress: () => wall.change(true),
            onSwipeUp: () => Get.to(AppsScreeen()),
            child: Obx(
              () => Image.memory(
                wall.wallpaper.value,
                fit: BoxFit.cover,
                height: Get.height,
              ),
            ),
          ),
          Obx(() {
            if (wall.showWallaper.value)
              return Positioned(bottom: 0, child: bottomSheet());
            return SizedBox();
          })
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: Get.width,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: <Widget>[
              ColButton(
                title: 'Wallpaper',
                icon: Icons.wallpaper,
              ),
              ColButton(
                title: 'Settings',
                icon: Icons.settings,
                onTap: () => Get.to(SettingsScreen()),
              ),
              ColButton(
                title: 'Widgets',
                icon: Icons.widgets,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
