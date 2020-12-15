import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final String title, subTitle;
  final Widget wTitle, wSubTitle, leading, trailing;
  const MyTile(
      {Key key,
      this.title,
      this.subTitle,
      this.wTitle,
      this.wSubTitle,
      this.leading,
      this.trailing})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: wTitle ?? Text(title),
      subtitle: wSubTitle ?? subTitle == null ? SizedBox() : Text(subTitle),
      leading: leading,
      trailing: trailing,
    );
  }
}
