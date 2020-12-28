import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:launcherx/controllers/settings.dart';
import 'package:launcherx/widgets/app_icon.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key key, this.appController}) : super(key: key);

  final appController;
  final SettingController settingController = Get.find();

  List _getAppWidgetList(var appList) {
    List<GridTile> _reqApp = [];
    appList.forEach((app) {
      _reqApp.add(
        GridTile(
          child: GestureDetector(
            child: AppIcon(
              settingController: settingController,
              image: app["icon"] != null ? (app["icon"]) : null,
            ),
            onTap: () => LauncherAssist.launchApp(app["package"]),
          ),
        ),
      );
    });

    return _reqApp;
  }

  Widget buildSearchResult() {
    if (!appController.showSearchResult.value) return SizedBox();
    List<GridTile> _appList = _getAppWidgetList(appController.filteredApps);
    return Container(
      color: Colors.grey.withOpacity(0.9),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 8,
        mainAxisSpacing: 5,
        childAspectRatio: 0.9,
        crossAxisSpacing: 4,
        physics: BouncingScrollPhysics(),
        children: _appList,
      ),
    );
  }

  GridView buildApps() {
    List<GridTile> _appList = _getAppWidgetList(appController.apps);
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 8,
      mainAxisSpacing: 5,
      childAspectRatio: 0.9,
      crossAxisSpacing: 4,
      physics: BouncingScrollPhysics(),
      children: _appList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [buildApps(), Obx(() => buildSearchResult())],
    );
  }
}
