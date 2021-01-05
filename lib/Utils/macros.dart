import 'package:flutter/material.dart';

myCustomCard(childern, {label = "Icon Shape"}) {
  return Card(
    margin: EdgeInsets.all(8.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(label), ...childern]),
    ),
  );
}
