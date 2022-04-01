// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, override_on_non_overriding_member
import 'package:clock_app/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'constants.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  DateTime now = DateTime.now();
  var formattedTime = DateFormat('HH:mm').format(DateTime.now());
  var formattedDate = DateFormat('EE, d MMM').format(DateTime.now());

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
              formattedTime,
              style: TextStyle(
                color: kOutlineBrushColor,
                fontSize: 60,
              ),
            ),
            Text(
              formattedDate,
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
