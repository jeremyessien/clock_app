// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'dart:math';
import 'package:clock_app/constants.dart';
import 'package:flutter/material.dart';

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
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    var cX = size.width / 2;
    var cY = size.height / 2;
    var center = Offset(cX, cY);
    var radius = min(cX, cY);

    var fillBrush = Paint()..color = kFillBrushColor;

    var outlineBrush = Paint()
      ..color = kOutlineBrushColor
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;

    var centerFillBrush = Paint()
      ..color = kOutlineBrushColor
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;
    
    var secondHand = Paint()
      ..color = Colors.orange.shade300
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    var minutesHand = Paint()
      ..shader = RadialGradient(colors: [kMinutesHandStart, kMinutesHandEnd]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var hourHand = Paint()
      ..shader = RadialGradient(colors: [kHourHandStart, kHourHandEnd]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;


    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);

    var hourHandX = cX + 60 * cos((dateTime.hour *30 + dateTime.minute*0.5) * pi/180);
    var hourHandY = cX + 60 * sin((dateTime.hour *30 + dateTime.minute*0.5) * pi/180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHand);

    var minutesHandX = cX + 80 * cos(dateTime.minute *6 * pi/180);
    var minutesHandY = cX + 80 * sin(dateTime.minute *6 * pi/180);
    canvas.drawLine(center, Offset(minutesHandX, minutesHandY), minutesHand);

    var secondHandX = cX + 80 * cos(dateTime.second *6* pi/180);
    var secondHandY = cX + 80 * sin(dateTime.second *6 * pi/180);
    canvas.drawLine(center, Offset(secondHandX, secondHandY), secondHand);

    canvas.drawCircle(center, 8, centerFillBrush);






  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
