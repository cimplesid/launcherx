import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:launcherx/controllers/settings.dart';
import 'package:launcherx/models/models.dart';

class _StorageHelper {
  final _currrentSettings = 'currentSettings';
  Settings settings;
  final SettingController settingController = Get.put(SettingController());

  final box = GetStorage();
  init() {
    _updateSetting();
  }

  changeSettings(Settings settings) {
    box
        .write(_currrentSettings, settings.toJson())
        .then((value) => _updateSetting());
  }

  _updateSetting() {
    var data = box.read(_currrentSettings);
    settings = data != null
        ? Settings.fromJson(box.read(_currrentSettings))
        : Settings.fromJson(defaultSettings);
    settingController.updateSetting(settings);
  }
}

final storageHelper = _StorageHelper();
