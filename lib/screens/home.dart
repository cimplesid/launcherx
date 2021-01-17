import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:launcherx/widgets/swipe_detector.dart';
import 'package:launcherx/controllers/apps.dart';
import 'package:launcherx/widgets/col_button.dart';
import 'package:launcherx/screens/all_apps.dart';
import 'package:launcherx/screens/settings.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  final wallpaperController = Get.put(MyApps());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SwipeDetector(
            ondouble: () {
              launch('tel:');
            },
            onPress: () => wallpaperController.change(false),
            longpress: () => wallpaperController.change(true),
            onSwipeUp: () => Get.to(AppsScreeen()),
            child: Obx(
              () => Image.memory(
                wallpaperController.wallpaper.value,
                fit: BoxFit.cover,
                height: Get.height,
                width: Get.width,
              ),
            ),
          ),
          Obx(() {
            if (wallpaperController.showWallaper.value)
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
                onTap: () async {
                  const platform = const MethodChannel('launcherx');
                  final int result =
                      await platform.invokeMethod('lock');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
