import 'package:flutter/material.dart';

class TextStyleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('TextStyleScreen'),),
        body: ListView(
          children: <Widget>[
            Text('Default Text'),
            Text(
              'Default Text FontSize 14',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Default Text FontSize 25',
              style: TextStyle(fontSize: 25),
            ),
            Text('Default Text FontWeight.w500',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),

            Text('Default Text textScaleFactor 1.0', textScaleFactor: 1.0),

            Text('Default Text textScaleFactor 2.0', textScaleFactor: 2.0),
          ],
        ));
  }
}
