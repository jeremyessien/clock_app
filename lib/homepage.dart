// ignore_for_file: prefer_const_constructors

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
          children: [
            Text(
              'Clock',
              style: TextStyle(
                color: kOutlineBrushColor,
                fontSize: 24,
              ),
            ),
            ClockView(),
          ],
        ),
      ),
    );
  }
}
