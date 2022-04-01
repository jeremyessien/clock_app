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
    return  Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: kContainerBackground,
        child: ClockView(),
      ),
    );
  }
}
