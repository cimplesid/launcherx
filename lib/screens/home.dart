import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launcherx/Utils/swipe_detector.dart';
import 'package:launcherx/controllers/apps.dart';
import 'package:launcherx/screens/all_apps.dart';

class HomeScreen extends StatelessWidget {
  final wall = Get.put(MyApps());
  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
      onSwipeUp: () => Get.to(AppsScreeen()),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.memory(
          wall.wallpaper != null ? wall.wallpaper : Uint8List(0),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
