import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:launcherx/controllers/settings.dart';
import 'package:launcherx/widgets/app_icon.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key key, this.appController}) : super(key: key);

  final appController;
  final SettingController settingController = Get.find();

  List<Widget> _getAppWidgetList(var appList) {
    var _reqApp = [];
    appList.forEach((app) {
      _reqApp.add(
        GestureDetector(
          child: AppIcon(
            settingController: settingController,
            image: app["icon"] != null ? (app["icon"]) : null,
          ),
          onTap: () => LauncherAssist.launchApp(app["package"]),
        ),
      );
    });

    return _reqApp;
  }

  Widget buildSearchResult() {
    if (!appController.showSearchResult.value) return SizedBox();
    List _appList = _getAppWidgetList(appController.filteredApps);
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

  buildApps() {
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
        childAspectRatio: Get.width / Get.height,
      ),
      children: [
        ...appController.apps.map(
          (app) => InkWell(
            child: AppIcon(
              appController: appController,
              settingController: settingController,
              image: app["icon"] != null ? (app["icon"]) : null,
              label: app['label'],
            ),
            onTap: () => LauncherAssist.launchApp(app["package"]),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildApps();
  }
}
