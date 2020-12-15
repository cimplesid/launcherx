import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launcherx/widgets/digitalClock.dart';
import 'package:launcherx/widgets/myTile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Card(
            child: Column(
              children: <Widget>[DigitalClock()],
            ),
          ),
        ),
      ),
    );
  }
}
