import 'package:device_apps/device_apps.dart';
import 'package:get/get.dart';

class MyApps extends GetxController {
  RxList<Application> apps = [].obs;

  @override
  void onInit() {
    super.onInit();
    _getAppList();
  }

  void _getAppList() {
    DeviceApps.getInstalledApplications(
      onlyAppsWithLaunchIntent: true,
      includeSystemApps: false,
      includeAppIcons: true,
    ).then((value) => this.apps.assignAll(value));
  }

  void refrehAppList() {
    _getAppList();
  }
}
