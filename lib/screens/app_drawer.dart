import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launcherx/widgets/my_tile.dart';
import 'icon_style.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.toString()),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: [
                MyTile(
                  wTitle: Text("Icon style"),
                  subTitle: 'icon size, label and more',
                  onTap: () => Get.to(IconStyle()),
                ),
                MyTile(
                  wTitle: Text("Drawer style"),
                  subTitle: 'Background color and more',
                  //TODO:make respective settings and navigate
                  // onTap: () => Get.to(IconStyle()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
