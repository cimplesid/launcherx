//designer
// {
//     "app_drawer":{
//         "drawerStyle":"",
//         "background_color":"",
//         "background_transparency":"",
//         "icon_layout":{
//             "size":12,
//             "isLabelOn":true,
//             "fontSize":12,
//             "color":"",
//             "shapeType":""
//         }
//         },
//     "looks_feel":{
//         "app_accent":"",
//         "show_notification_bar":false,
//         "transparent_notification_bar":false,
//         "notification_bar_color":"",
//         "appsearch_bg_color":""
//     },
//     "gesture_input":{
//         "swipe_up":"",
//         "swipe_down":"",
//         "double_tap":""

//     },
//     "backup_imports":{
//         "paths":["dsa"]
//     }
// }
// To parse this JSON data, do
//
//     final settings = settingsFromJson(jsonString);

import 'dart:convert';
//TODO:make all colors with their type
Settings settingsFromJson(String str) => Settings.fromJson(json.decode(str));

String settingsToJson(Settings data) => json.encode(data.toJson());

class Settings {
  Settings({
    this.appDrawer,
    this.looksFeel,
    this.gestureInput,
    this.backupImports,
  });

  AppDrawer appDrawer;
  LooksFeel looksFeel;
  GestureInput gestureInput;
  BackupImports backupImports;

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        appDrawer: AppDrawer.fromJson(json["app_drawer"]),
        looksFeel: LooksFeel.fromJson(json["looks_feel"]),
        gestureInput: GestureInput.fromJson(json["gesture_input"]),
        backupImports: BackupImports.fromJson(json["backup_imports"]),
      );

  Map<String, dynamic> toJson() => {
        "app_drawer": appDrawer.toJson(),
        "looks_feel": looksFeel.toJson(),
        "gesture_input": gestureInput.toJson(),
        "backup_imports": backupImports.toJson(),
      };
}

class AppDrawer {
  AppDrawer({
    this.drawerStyle,
    this.backgroundColor,
    this.backgroundTransparency,
    this.iconLayout,
  });

  String drawerStyle;
  String backgroundColor;
  String backgroundTransparency;
  IconLayout iconLayout;

  factory AppDrawer.fromJson(Map<String, dynamic> json) => AppDrawer(
        drawerStyle: json["drawerStyle"],
        backgroundColor: json["background_color"],
        backgroundTransparency: json["background_transparency"],
        iconLayout: IconLayout.fromJson(json["icon_layout"]),
      );

  Map<String, dynamic> toJson() => {
        "drawerStyle": drawerStyle,
        "background_color": backgroundColor,
        "background_transparency": backgroundTransparency,
        "icon_layout": iconLayout.toJson(),
      };
}

class IconLayout {
  IconLayout({
    this.size,
    this.isLabelOn,
    this.fontSize,
    this.color,
    this.shapeType,
  });

  int size;
  bool isLabelOn;
  int fontSize;
  String color;
  String shapeType;

  factory IconLayout.fromJson(Map<String, dynamic> json) => IconLayout(
        size: json["size"],
        isLabelOn: json["isLabelOn"],
        fontSize: json["fontSize"],
        color: json["color"],
        shapeType: json["shapeType"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "isLabelOn": isLabelOn,
        "fontSize": fontSize,
        "color": color,
        "shapeType": shapeType,
      };
}

class BackupImports {
  BackupImports({
    this.paths,
  });

  List<String> paths;

  factory BackupImports.fromJson(Map<String, dynamic> json) => BackupImports(
        paths: List<String>.from(json["paths"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "paths": List<dynamic>.from(paths.map((x) => x)),
      };
}

class GestureInput {
  GestureInput({
    this.swipeUp,
    this.swipeDown,
    this.doubleTap,
  });

  String swipeUp;
  String swipeDown;
  String doubleTap;

  factory GestureInput.fromJson(Map<String, dynamic> json) => GestureInput(
        swipeUp: json["swipe_up"],
        swipeDown: json["swipe_down"],
        doubleTap: json["double_tap"],
      );

  Map<String, dynamic> toJson() => {
        "swipe_up": swipeUp,
        "swipe_down": swipeDown,
        "double_tap": doubleTap,
      };
}

class LooksFeel {
  LooksFeel({
    this.appAccent,
    this.showNotificationBar,
    this.transparentNotificationBar,
    this.notificationBarColor,
    this.appsearchBgColor,
  });

  String appAccent;
  bool showNotificationBar;
  bool transparentNotificationBar;
  String notificationBarColor;
  String appsearchBgColor;

  factory LooksFeel.fromJson(Map<String, dynamic> json) => LooksFeel(
        appAccent: json["app_accent"],
        showNotificationBar: json["show_notification_bar"],
        transparentNotificationBar: json["transparent_notification_bar"],
        notificationBarColor: json["notification_bar_color"],
        appsearchBgColor: json["appsearch_bg_color"],
      );

  Map<String, dynamic> toJson() => {
        "app_accent": appAccent,
        "show_notification_bar": showNotificationBar,
        "transparent_notification_bar": transparentNotificationBar,
        "notification_bar_color": notificationBarColor,
        "appsearch_bg_color": appsearchBgColor,
      };
}
