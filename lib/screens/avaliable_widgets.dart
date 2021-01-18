import 'package:flutter/material.dart';
import 'package:launcherx/utils/macros.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AvaliableWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //TODO:make better UI and general widget
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.black)),
              child: IconButton(
                icon: Icon(MdiIcons.powerSettings),
                onPressed: () async => lockScreen(),
              ),
            ),
          ),
          Text('Lock Screen widget')
        ],
      ),
    );
  }
}
