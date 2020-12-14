import 'package:flutter/material.dart';
import 'package:launcherx/widgets/myTile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Card(
        child: Column(
          children: <Widget>[
            MyTile(
              title: 'App Drawer',
              leading: Icon(MdiIcons.muffin),
            ),
            MyTile(
              title: 'Looks and Feel',
              leading: Icon(MdiIcons.looks),
            ),
            MyTile(
              title: 'Gestures and Inputs',
              leading: Icon(MdiIcons.gesture),
            ),
            MyTile(
              title: 'Backup and imports',
              leading: Icon(MdiIcons.gesture),
            ),
          ],
        ),
      ),
    );
  }
}
