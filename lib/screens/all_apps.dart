import 'package:flutter/material.dart';
import 'package:launcherx/controllers/apps.dart';
import 'package:get/get.dart';
import 'package:launcherx/widgets/app_widget.dart';
import 'package:launcherx/widgets/search_widget.dart';

class AppsScreeen extends StatelessWidget {
  final appController = Get.put(MyApps());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                Expanded(child: SearchAppWidget(appController: appController)),
              ],
            ),
            Flexible(child: AppWidget(appController: appController)),
          ],
        ),
      ),
    );
  }
}
