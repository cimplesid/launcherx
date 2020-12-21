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
  List<dynamic> displayApps = Get.put(MyApps()).apps;
  final TextEditingController _searchController = TextEditingController();

  // search bar on the top
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
            _upDateAppList(query: _searchController.text);
          },
        ),
      ),
    );
  }

  // this function will update the displayApps list with the searched apps only
  void _upDateAppList({String query}) {
    query = query.trim().toLowerCase();
    var _allApps = Get.put(MyApps()).apps;
    var _reqApp = [];
    _allApps.forEach((app) {
      if (app['label'].toString().toLowerCase().contains(query)) {
        _reqApp.add(app);
      }
    });
    setState(() {
      this.displayApps = _reqApp;
    });
  }

  // this will build the GridView of the app
  GridView buildApps() {
    List<GridTile> appList = [];
    displayApps.forEach((app) {
      appList.add(
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

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 8,
      mainAxisSpacing: 5,
      childAspectRatio: 0.9,
      crossAxisSpacing: 4,
      physics: BouncingScrollPhysics(),
      children: appList,
    );
  }

  @override
  Widget build(BuildContext context) {
    displayApps
        .sort((a, b) => a['label'].toString().compareTo(b['label'].toString()));
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.0),
      body: ListView(
        children: [
          buildSearchBar(),
          buildApps(),
        ],
      ),
    );
  }
}
