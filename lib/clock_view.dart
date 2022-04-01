import 'dart:math';

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 300,
      height: 300,
      // ignore: prefer_const_constructors
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var cX = size.width/2;
    var cY = size.height/2;
    var center = Offset(cX, cY);
    var radius = min(cX, cY);

    canvas.drawCircle(center, radius, paint)
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
