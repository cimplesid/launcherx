import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launcherx/Utils/storage.dart';
import 'package:launcherx/controllers/apps.dart';
import 'package:launcherx/controllers/settings.dart';

class IconStyle extends StatelessWidget {
  final MyApps wall = Get.find();
  final SettingController settingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$this"),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Obx(
                () => Image.memory(
                  wall.wallpaper.value,
                  fit: BoxFit.cover,
                  height: Get.height / 3,
                  width: Get.width,
                ),
              ),
              Positioned(
                top: 100,
                left: 100,
                child: Row(
                  children: [
                    Obx(() => Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                settingController
                                    .setting.value.appDrawer.iconLayout.shape),
                            color: Get.theme.primaryColor,
                          ),
                          child: Icon(
                            Icons.gavel_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Icon Shape"),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    spacing: 50,
                    children: [
                      _buildShapeTile(10),
                      _buildShapeTile(0),
                      _buildShapeTile(20),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: _buildShapeTile(40),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildShapeTile(double radius) {
    return InkWell(
      onTap: () {
        var settings = storageHelper.settings;
        storageHelper.settings.appDrawer.iconLayout.shape = radius;
        storageHelper.changeSettings(settings);
      },
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
