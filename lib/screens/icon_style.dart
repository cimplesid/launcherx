import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launcherx/Utils/storage.dart';
import 'package:launcherx/controllers/apps.dart';
import 'package:launcherx/controllers/settings.dart';
import 'package:launcherx/widgets/app_icon.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IconStyle extends StatelessWidget {
  final MyApps wallPaperController = Get.find();
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
                  wallPaperController.wallpaper.value,
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
                      AppIcon(
                        settingController: settingController,
                        color: Get.theme.accentColor,
                        child: Icon(
                          Icons.gavel_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      AppIcon(
                        settingController: settingController,
                        color: Get.theme.accentColor,
                        child: Icon(
                          MdiIcons.twitter,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      AppIcon(
                        settingController: settingController,
                        color: Colors.green,
                        child: Icon(
                          MdiIcons.accountSettings,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
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
                max: 120,
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

//TODO:make widget instead
  myCustomCard(childern, {label = "Icon Shape"}) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(label), ...childern]),
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
