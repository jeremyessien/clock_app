import 'dart:math';

import 'package:flutter/material.dart';

class AnalogClockPainter extends CustomPainter {
  final int hour;
  final int minute;
  final int second;
  final DateTime now = DateTime.now();

  AnalogClockPainter({
    required this.hour,
    required this.minute,
    required this.second,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Paint fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw the outer ring
    paint.color = Colors.grey.shade800;
    paint.strokeWidth = 10;
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);

    // Draw the inner circle (clock face)
    paint.color = Colors.grey.shade900;
    paint.strokeWidth = 0;
    canvas.drawCircle(size.center(Offset.zero), size.width / 2 - 10, paint);

    // Draw hour markers
    paint.color = Colors.white;
    paint.strokeWidth = 5;
    for (int i = 0; i < 12; i++) {
      double angle = i * (pi / 6);
      double x1 = size.width / 2 + (size.width / 2 - 30) * cos(angle);
      double y1 = size.height / 2 + (size.width / 2 - 30) * sin(angle);
      double x2 = size.width / 2 + (size.width / 2 - 10) * cos(angle);
      double y2 = size.height / 2 + (size.width / 2 - 10) * sin(angle);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }

    // Draw seconds markers
    paint.color = Colors.white.withOpacity(0.5);
    paint.strokeWidth = 1;
    for (int i = 0; i < 60; i++) {
      double angle = i * (pi / 30);
      double x1 = size.width / 2 + (size.width / 2 - 20) * cos(angle);
      double y1 = size.height / 2 + (size.width / 2 - 20) * sin(angle);
      double x2 = size.width / 2 + (size.width / 2 - 10) * cos(angle);
      double y2 = size.height / 2 + (size.width / 2 - 10) * sin(angle);
      if (i % 5 != 0) {
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
      }
    }

    // Draw clock hands
    paint.strokeWidth = 6;
    paint.strokeCap = StrokeCap.round;

    double hourAngle = (hour % 12) * (pi / 6) + (minute / 60) * (pi / 6);
    double minuteAngle = minute * (pi / 30);
    double secondAngle = second * (pi / 30);

    paint.color = Colors.white;
    canvas.drawLine(
        size.center(Offset.zero),
        Offset(size.width / 2 * 0.5 * cos(hourAngle - pi / 2) + size.width / 2,
            size.height / 2 * 0.5 * sin(hourAngle - pi / 2) + size.height / 2),
        paint);

    paint.strokeWidth = 4;
    canvas.drawLine(
        size.center(Offset.zero),
        Offset(
            size.width / 2 * 0.7 * cos(minuteAngle - pi / 2) + size.width / 2,
            size.height / 2 * 0.7 * sin(minuteAngle - pi / 2) +
                size.height / 2),
        paint);

    paint.color = Colors.brown;
    paint.strokeWidth = 2;
    canvas.drawLine(
        size.center(Offset.zero),
        Offset(
            size.width / 2 * 0.9 * cos(secondAngle - pi / 2) + size.width / 2,
            size.height / 2 * 0.9 * sin(secondAngle - pi / 2) +
                size.height / 2),
        paint);

    // Draw the center circle
    paint.color = Colors.brown;
    paint.strokeWidth = 0;
    canvas.drawCircle(size.center(Offset.zero), 8, fillPaint);

    // Draw the base for the second hand
    paint.color = Colors.white;
    canvas.drawCircle(size.center(Offset.zero), 5, fillPaint);

    // Add Month and Day Labels
    final TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    final List<String> weekdays = [
      'Sun',
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat'
    ];
    final String month = months[now.month - 1];
    final String weekday = weekdays[now.weekday - 1];

    // Month label at 9 o'clock
    textPainter.text = TextSpan(
      text: month,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(size.width / 2 - textPainter.width / 2 - 75,
          size.height / 2 - textPainter.height / 2),
    );

    // Day label at 3 o'clock
    textPainter.text = TextSpan(
      text: weekday,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(size.width / 2 - textPainter.width / 2 + 72,
          size.height / 2 - textPainter.height / 2),
    );
  
    // Draw Moon Phase Indicator at 6 o'clock
  
    final Rect moonRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2 + size.width / 2 * 0.8 - 40),
      width: 60,
      height: 60,
    );

    // Draw the moon's gradient
    final Paint moonGradientPaint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.grey.shade800, Colors.grey.shade300],
        stops: const [0.2, 1.0],
      ).createShader(moonRect)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2 + size.width / 2 * 0.8 - 40),
      30,
      moonGradientPaint,
    );

    // Draw the moon phase (simple crescent shape)
    final Paint phasePaint = Paint()
      ..color = Colors.grey.shade600
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2 + size.width / 2 * 0.8 -40),
        width: 60,
        height: 60,
      ),
      -pi / 4,
      pi / 2,
      true,
      phasePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
