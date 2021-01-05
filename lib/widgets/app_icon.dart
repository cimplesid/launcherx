import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launcherx/controllers/apps.dart';
import 'package:launcherx/controllers/settings.dart';

class AppIcon extends StatelessWidget {
  final SettingController settingController;
  final MyApps appController;
  final image;
  final Widget child;
  final Color color;
  final String label;

  const AppIcon(
      {Key key,
      this.settingController,
      this.image,
      this.child,
      this.color,
      this.label,
      this.appController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        child ??
            Obx(
              () => Image.memory(
                image,
                fit: BoxFit.contain,
                width:
                    (settingController.setting.value.appDrawer.iconLayout.size)
                        .toDouble(),
                height:
                    (settingController.setting.value.appDrawer.iconLayout.size)
                        .toDouble(),
              ),
            ),
        if (label != null)
          Obx(
            () =>
                (settingController.setting.value.appDrawer.iconLayout.isLabelOn)
                    ? Flexible(
                        child: Text(
                          label,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: (settingController.setting.value
                                      .appDrawer.iconLayout.fontSize)
                                  .toDouble()),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )
                    : SizedBox(),
          ),
      ],
    );
  }
}
