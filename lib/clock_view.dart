// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'dart:math';
import 'package:clock_app/constants.dart';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  final double size;

  const ClockView({Key? key, required this.size}) : super(key: key);
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: widget.size,
      height: widget.size,
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
      ..strokeWidth = size.width/20
      ..style = PaintingStyle.stroke;

    var centerFillBrush = Paint()
      ..color = kOutlineBrushColor
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;
    
    var secondHand = Paint()
      ..color = Colors.orange.shade300
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width/60
      ..style = PaintingStyle.stroke;

    var minutesHand = Paint()
      ..shader = RadialGradient(colors: [kMinutesHandStart, kMinutesHandEnd]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = size.width/30
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var hourHand = Paint()
      ..shader = RadialGradient(colors: [kHourHandStart, kHourHandEnd]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = size.width/24
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var dashBrush = Paint()
    ..color = kOutlineBrushColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;


    canvas.drawCircle(center, radius *0.75, fillBrush);
    canvas.drawCircle(center, radius *0.75, outlineBrush);

    var hourHandX = cX + radius * 0.4 * cos((dateTime.hour *30 + dateTime.minute*0.5) * pi/180);
    var hourHandY = cX +  radius * 0.4 *  sin((dateTime.hour *30 + dateTime.minute*0.5) * pi/180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHand);

    var minutesHandX = cX + radius * 0.6 *  cos(dateTime.minute *6 * pi/180);
    var minutesHandY = cX + radius * 0.6 *  sin(dateTime.minute *6 * pi/180);
    canvas.drawLine(center, Offset(minutesHandX, minutesHandY), minutesHand);

    var secondHandX = cX + radius * 0.6 *  cos(dateTime.second *6* pi/180);
    var secondHandY = cX + radius * 0.6 * sin(dateTime.second *6 * pi/180);
    canvas.drawLine(center, Offset(secondHandX, secondHandY), secondHand);

    canvas.drawCircle(center, radius * 0.04, centerFillBrush);

    var externalRadius = radius;
    var internalRadius = radius * 0.9;

    for (var i = 0; i< 360; i+= 12){
      var x1 = cX + externalRadius * cos(i* pi / 180);
      var y1 = cY + internalRadius * sin(i* pi / 180);

      var x2 = cX + externalRadius * cos(i* pi / 180);
      var y2 = cY + internalRadius * sin(i* pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);

    }




  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
