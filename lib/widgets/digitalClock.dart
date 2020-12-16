import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class DigitalClock extends StatelessWidget {
  String getTime() {
    var now = DateTime.now();
    return DateFormat("H:m").format(now);
  }

  String getDate() {
    var now = DateTime.now();
    return DateFormat("EEE, dd MMM").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60.0),
        color: Colors.white,
      ),
      child: TimerBuilder.periodic(
        Duration(seconds: 1),
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  "${getTime()}",
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  "${getDate()}",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
