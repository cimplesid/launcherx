import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:launcherx/controllers/icon_size_controller.dart';

class AppWidget extends StatelessWidget {
  final appController;

  const AppWidget({Key key, this.appController}) : super(key: key);

  List _getAppWidgetList(var appList) {
    final IconSize iconSize = Get.put(IconSize());

    List<GridTile> _reqApp = [];
    appList.forEach((app) {
      _reqApp.add(
        GridTile(
          child: GestureDetector(
            child: GetBuilder<IconSize>(
              builder: (_) {
                print(iconSize.radiusValue());
                return Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(iconSize.radiusValue()),
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
                );
              },
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
