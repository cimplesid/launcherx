import 'package:flutter/material.dart';

class SearchAppWidget extends StatelessWidget {
  final appController;

  const SearchAppWidget({Key key, this.appController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        disabledBorder: InputBorder.none,
        hintText: "Search",
        hintStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.only(left: 10.0),
      ),
      style: TextStyle(color: Colors.white),
      onChanged: (value) {
        if (value != null && value.length > 0)
          appController.searchApp(value.trim().toLowerCase());
        else
          appController.clearFilteredApps();
      },
    );
  }
}
