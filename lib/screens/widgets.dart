import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launcherx/widgets/myTile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: Card(
        child: Column(
          children: <Widget>[
            MyTile(
              title: 'Clock',
              leading: Icon(MdiIcons.clock),
            )
          ],
        ),
      ),
    );
  }
}
