import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerX {
  PermissionStatus permissionStatus = PermissionStatus.undetermined;
  Permission permission = Permission.storage;

  Future _listenForPermissionStatus() async {
    final status = await permission.status;
    permissionStatus = status;
  }

  Future<void> requestPermission() async {
    final status = await permission.request();
    permissionStatus = status;
  }

  Future<bool> checkPermission() async {
    await _listenForPermissionStatus();

    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }
}

final permision = PermissionHandlerX();
