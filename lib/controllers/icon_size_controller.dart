import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IconSize extends GetxController {
  final GetStorage _box = GetStorage();
  double radius = 0.0;

  void change(double rad) {
    _box.write('radius', rad);
    this.radius = rad;
    update();
  }

  double radiusValue() {
    return _box.read('radius');
  }
}
