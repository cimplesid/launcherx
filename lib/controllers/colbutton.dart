import 'package:flutter/material.dart';

class ColButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  ColButton(
      {Key key, this.title = '', this.icon = Icons.tap_and_play, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, color: Colors.white),
            ),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
