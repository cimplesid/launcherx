import 'package:get/get.dart';
import 'package:launcherx/models/models.dart';

class SettingController extends GetxController {
  var setting = Settings().obs;

  updateSetting(Settings settings) {
    this.setting.value = settings;
  }
}
