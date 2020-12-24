import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launcherx/controllers/settings.dart';

class AppIcon extends StatelessWidget {
  final SettingController settingController;
  final image;
  final Widget child;
  final Color color;

  const AppIcon(
      {Key key, this.settingController, this.image, this.child, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                settingController.setting.value.appDrawer.iconLayout.shape),
            color: color ??
                Color(
                    settingController.setting.value.appDrawer.iconLayout.color),
            image: image != null
                ? DecorationImage(
                    fit: BoxFit.cover,
                    image: MemoryImage(image),
                  )
                : null),
        child: child));
  }
}
