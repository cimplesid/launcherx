import 'package:flutter/material.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:launcherx/Utils/permission_handler.dart';
import 'package:launcherx/controllers/apps.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AppsScreeen extends StatelessWidget {
  final apps = Get.put(MyApps());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          AppWIdget(),
          Positioned(
            top: 0,
            left: 20,
            child: SafeArea(
              child: Tooltip(
                message: "back",
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          if (permision.permissionStatus != PermissionStatus.granted)
            Positioned(
              top: 0,
              right: 20,
              child: SafeArea(
                child: Tooltip(
                  message: "Click this to allow storage permission",
                  child: GestureDetector(
                    onTap: () {
                      apps.getWallpaper();
                    },
                    child: Icon(
                      Icons.storage,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class AppWIdget extends StatefulWidget {
  @override
  _AppWIdgetState createState() => _AppWIdgetState();
}

class _AppWIdgetState extends State<AppWIdget> {
  var displayApps = Get.put(MyApps());
  final TextEditingController _searchController = TextEditingController();
  bool displaySearchResult = false;

  Widget buildSearchBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 8, 8, 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey.withOpacity(0.6),
        ),
        child: TextField(
          decoration: InputDecoration(
            disabledBorder: InputBorder.none,
            hintText: "Search",
            contentPadding: EdgeInsets.only(left: 10.0),
          ),
          controller: _searchController,
          onChanged: (value) {
            setState(() {
              if (value.isEmpty)
                displaySearchResult = false;
              else
                displaySearchResult = true;
            });
            displayApps.updateAppList(_searchController.text);
          },
        ),
      ),
    );
  }

  List _getAppWidgetList(var appList) {
    List<GridTile> _reqApp = [];
    appList.forEach((app) {
      _reqApp.add(
        GridTile(
          child: GestureDetector(
            child: CircleAvatar(
              backgroundImage:
                  app["icon"] != null ? MemoryImage(app["icon"]) : null,
              radius: 30.0,
              child: app["icon"] == null ? Text(app["label"][0]) : Text(""),
            ),
            onTap: () => LauncherAssist.launchApp(app["package"]),
          ),
        ),
      );
    });
    return _reqApp;
  }

  Widget buildSearchResult() {
    List<GridTile> _appList = _getAppWidgetList(displayApps.filteredApps);
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
    List<GridTile> _appList = _getAppWidgetList(displayApps.apps);
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
    displayApps.apps
        .sort((a, b) => a['label'].toString().compareTo(b['label'].toString()));
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.0),
      body: ListView(
        children: [
          buildSearchBar(),
          Stack(
            children: [
              buildApps(),
              displaySearchResult ? buildSearchResult() : Text(''),
            ],
          ),
        ],
      ),
    );
  }
}
