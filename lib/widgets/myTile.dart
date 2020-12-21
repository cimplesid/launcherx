import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final String title, subTitle;
  final Widget wTitle, wSubTitle, leading, trailing;
  final VoidCallback onTap;
  const MyTile({
    Key key,
    this.title,
    this.subTitle,
    this.wTitle,
    this.wSubTitle,
    this.leading,
    this.onTap,
    this.trailing,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: wTitle ?? Text(title),
      subtitle: wSubTitle ?? Text(subTitle),
      leading: leading,
      onTap: onTap,
      trailing: trailing,
    );
  }
}
