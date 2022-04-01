import 'dart:math';

import 'package:clock_app/constants.dart';
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
    var cX = size.width / 2;
    var cY = size.height / 2;
    var center = Offset(cX, cY);
    var radius = min(cX, cY);
    var fillBrush = Paint()..color = kFillBrushColor;
    var outlineBrush = Paint()
      ..color = kOutlineBrushColor
      ..strokeWidth = 13
      ..style = PaintingStyle.stroke;

    var centerFillBrush = Paint()
      ..color = kOutlineBrushColor
      ..strokeWidth = 13
      ..style = PaintingStyle.stroke;
    
    var secondHand = Paint()
      ..color = Colors.orange.shade300
      ..strokeWidth = 13
      ..style = PaintingStyle.stroke;

    var minutesHand = Paint()
      // ignore: prefer_const_constructors, prefer_const_literals_to_create_immutables
      ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.pink]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = 13
      ..style = PaintingStyle.stroke;
    

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);
    canvas.drawCircle(center, 16, centerFillBrush);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
