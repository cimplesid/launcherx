import 'package:get_storage/get_storage.dart';
import 'package:launcherx/models/models.dart';

class StorageHelper {
  final _currrentSettings = 'currentSettings';
  Settings settings;
  final box = GetStorage();

  init() {
    _updateSetting();
  }

  changeSettings(Settings settings) {
    box.write(_currrentSettings, settings).then((value) => _updateSetting());
  }

  _updateSetting() {
    settings = box.read(_currrentSettings) ?? Settings();
  }
}

final storageHelper = StorageHelper();
