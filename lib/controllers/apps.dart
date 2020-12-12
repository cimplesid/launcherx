import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:launcherx/Utils/permission_handler.dart';

class MyApps extends GetxController {
  List apps = [];
  var wallpaper = Uint8List(0).obs;
  var show = false.obs;
  @override
  void onInit() async {
    super.onInit();
    getWallpaper();
    _getAppList();
  }

  change(val) {
    show.value = val;
  }

  void _getAppList() {
    LauncherAssist.getAllApps().then((var apps) {
      this.apps = apps;
    });
  }

  getWallpaper() async {
    var per = await permision.checkPermission();
    if (!per) permision.requestPermission();
    LauncherAssist.getWallpaper().then((a) {
      wallpaper.value = a;
    });
  }

  void refrehAppList() {
    _getAppList();
  }
}
