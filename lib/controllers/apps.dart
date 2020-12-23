import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:launcherx/Utils/permission_handler.dart';

class MyApps extends GetxController {
  List apps = [];
  RxList<dynamic> filteredApps = [].obs;
  var wallpaper = Uint8List(0).obs;
  var showWallaper = false.obs;
  get showSearchResult => (filteredApps.length > 0).obs;
  @override
  void onInit() async {
    super.onInit();
    getWallpaper();
    _getAppList();
  }

  change(val) {
    showWallaper.value = val;
  }

  void searchApp(String query) {
    assert(query != null);
    assert(apps.isNotEmpty);
    filteredApps.assignAll(this
        .apps
        .where((app) => app['label'].toString().toLowerCase().contains(query)));
  }

  clearFilteredApps() {
    filteredApps.clear();
  }

  void _getAppList() {
    LauncherAssist.getAllApps().then((var apps) {
      this.apps = apps;
      this.apps.sort(
          (a, b) => a['label'].toString().compareTo(b['label'].toString()));
    });
  }

  getWallpaper() async {
    var per = await permision.checkPermission();
    if (!per) {
      permision
          .requestPermission()
          .then((value) => LauncherAssist.getWallpaper().then((a) {
                wallpaper.value = a;
              }));
    }
    LauncherAssist.getWallpaper().then((a) {
      wallpaper.value = a;
    });
  }

  void refrehAppList() {
    _getAppList();
  }
}
