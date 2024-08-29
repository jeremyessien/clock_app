import 'package:clock_app/ui/analog_clock_painter.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class AnalogClock extends StatefulWidget {
  const AnalogClock({Key? key}) : super(key: key);

  @override
  State<AnalogClock> createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_controller.isAnimating) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: 250,
      height: 250,
      child: CustomPaint(
        painter: AnalogClockPainter(
          hour: DateTime.now().hour,
          minute: DateTime.now().minute,
          second: DateTime.now().second,
        ),
      ),
    );
  }
}
