import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launcherx/Utils/storage.dart';
import 'package:launcherx/controllers/apps.dart';
import 'package:launcherx/controllers/settings.dart';
import 'package:launcherx/utils/macros.dart';
import 'package:launcherx/widgets/app_icon.dart';

class IconStyle extends StatelessWidget {
  final MyApps appController = Get.find();
  final SettingController settingController = Get.put(SettingController());
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
                  appController.wallpaper.value,
                  fit: BoxFit.cover,
                  height: Get.height / 3,
                  width: Get.width,
                ),
              ),
              Positioned(
                top: 100,
                left: 10,
                child: Container(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //TODO: change according to settings
                      for (var i = 0; i < 4; i++)
                        Container(
                          height: 100,
                          child: AppIcon(
                            settingController: settingController,
                            image: appController.apps[i]["icon"] != null
                                ? (appController.apps[i]["icon"])
                                : null,
                            label: appController.apps[i]['label'],
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
          myCustomCard([
            Obx(
              () => Slider(
                min: 10,
                max: 85,
                label: 'Icon Size',
                onChanged: (double value) {
                  var settings = storageHelper.settings;
                  storageHelper.settings.appDrawer.iconLayout.size =
                      value.toInt();
                  storageHelper.changeSettings(settings);
                },
                value:
                    (settingController.setting.value.appDrawer.iconLayout.size)
                        .toDouble(),
              ),
            ),
            Obx(
              () => SwitchListTile(
                title: Text('Label'),
                onChanged: (bool value) {
                  var settings = storageHelper.settings;
                  storageHelper.settings.appDrawer.iconLayout.isLabelOn = value;
                  storageHelper.changeSettings(settings);
                },
                value: settingController
                    .setting.value.appDrawer.iconLayout.isLabelOn,
              ),
            ),
            Text('Font size'),
            Obx(
              () => Slider(
                min: 10,
                max: 25,
                label: 'Font Size',
                onChanged: settingController
                        .setting.value.appDrawer.iconLayout.isLabelOn
                    ? (double value) {
                        var settings = storageHelper.settings;
                        storageHelper.settings.appDrawer.iconLayout.fontSize =
                            value.toInt();
                        storageHelper.changeSettings(settings);
                      }
                    : null,
                value: (settingController
                        .setting.value.appDrawer.iconLayout.fontSize)
                    .toDouble(),
              ),
            ),
          ], label: 'Icon Size'),
          myCustomCard([
            SizedBox(height: 20),
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
          ])
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
