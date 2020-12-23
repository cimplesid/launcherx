import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:launcherx/controllers/settings.dart';

class AppWidget extends StatelessWidget {
  final appController;

  AppWidget({Key key, this.appController}) : super(key: key);
  SettingController settingController = Get.find();

  List _getAppWidgetList(var appList) {
    List<GridTile> _reqApp = [];
    appList.forEach((app) {
      _reqApp.add(
        GridTile(
          child: GestureDetector(
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    settingController.setting.value.appDrawer.iconLayout.shape),
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: app["icon"] != null
                      ? MemoryImage(
                          app["icon"],
                        )
                      : null,
                ),
              ),
            ),
            onTap: () => LauncherAssist.launchApp(app["package"]),
          ),
        ),
      );
    });
    // child: CircleAvatar(
    // backgroundImage:

    // radius: 30.0,
    // child: app["icon"] == null ? Text(app["label"][0]) : Text(""),
    // ),
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
