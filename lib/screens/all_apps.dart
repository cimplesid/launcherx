import 'package:flutter/material.dart';
import 'package:launcherx/Utils/permission_handler.dart';
import 'package:launcherx/controllers/apps.dart';
import 'package:get/get.dart';
import 'package:launcherx/widgets/app_widget.dart';
import 'package:launcherx/widgets/search_widget.dart';
import 'package:permission_handler/permission_handler.dart';

class AppsScreeen extends StatelessWidget {
  final appController = Get.put(MyApps());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
            Expanded(child: SearchAppWidget(appController: appController))
          ],
        ),
        Stack(
          children: <Widget>[
            AppWidget(appController: appController),
            if (permision.permissionStatus != PermissionStatus.granted)
              Positioned(
                top: 0,
                right: 20,
                child: SafeArea(
                  child: Tooltip(
                    message: "Click this to allow storage permission",
                    child: GestureDetector(
                      onTap: () {
                        appController.getWallpaper();
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
      ]),
    );
  }
}
