// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:clock_app/clock_view.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerBackground,
      body: Container(
        padding: EdgeInsets.all(32),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Clock',
              style: TextStyle(
                color: kOutlineBrushColor,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Clock',
              style: TextStyle(
                color: kOutlineBrushColor,
                fontSize: 60,
              ),
            ),
            Text(
              'Clock',
              style: TextStyle(
                color: kOutlineBrushColor,
                fontSize: 20,
              ),
            ),
            ClockView(),
            Text(
              'Timezone',
              style: TextStyle(
                color: kOutlineBrushColor,
                fontSize: 24,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.language,
                  color: kOutlineBrushColor,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'UTC',
                  style: TextStyle(
                    color: kOutlineBrushColor,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
