import 'package:flutter/material.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:launcherx/Utils/permission_handler.dart';
import 'package:launcherx/Utils/swipe_detector.dart';
import 'package:launcherx/controllers/apps.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AppsScreeen extends StatelessWidget {
  final apps = Get.put(MyApps());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SwipeDetector(
        onSwipeDown: () {
          print('sas');
          Get.back();
        },
        child: Stack(
          children: <Widget>[
            AppWIdget(),
            Positioned(
              top: 0,
              left: 20,
              child: SafeArea(
                child: Tooltip(
                  message: "back",
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
            if (permision.permissionStatus != PermissionStatus.granted)
              Positioned(
                top: 0,
                right: 20,
                child: SafeArea(
                  child: Tooltip(
                    message: "Click this to allow storage permission",
                    child: GestureDetector(
                      onTap: () {
                        apps.getWallpaper();
                      },
                      child: Icon(
                        Icons.storage,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class AppWIdget extends StatelessWidget {
  final apps = Get.put(MyApps());

  @override
  Widget build(BuildContext context) {
    apps.apps
        .sort((a, b) => a['label'].toString().compareTo(b['label'].toString()));
    return Container(
      padding: EdgeInsets.fromLTRB(30, 35, 30, 0),
      child: GridView.count(
        crossAxisCount: 8,
        mainAxisSpacing: 5,
        childAspectRatio: 9 / 10,
        crossAxisSpacing: 4,
        physics: BouncingScrollPhysics(),
        children: List.generate(
          apps.apps.length,
          (index) {
            return GestureDetector(
              child: CircleAvatar(
                backgroundImage: apps.apps[index]["icon"] != null
                    ? MemoryImage(apps.apps[index]["icon"])
                    : null,
                radius: 30,
                child: apps.apps[index]["icon"] == null
                    ? Text(apps.apps[index]["label"][0])
                    : null,
              ),
              onTap: () =>
                  LauncherAssist.launchApp(apps.apps[index]["package"]),
            );
          },
        ),
      ),
    );
  }
}
