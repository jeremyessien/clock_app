import 'dart:async';
import 'package:flutter/material.dart';

class DigitalClockProvider with ChangeNotifier {
  late DateTime _currentTime;
  late DateTime _currentTimeUtc;
  Timer? _timer;

  DigitalClockProvider() {
    _currentTime = DateTime.now();
    _currentTimeUtc = DateTime.now().toUtc();
    _startTimer();
  }

  DateTime get currentTime => _currentTime;
  DateTime get currentTimeUtc => _currentTimeUtc;

  String get fractionalSeconds {
    int milliseconds = _currentTime.millisecond;
    double fractionalSecond = milliseconds / 1000;
    return '${_currentTime.second}.${(fractionalSecond * 10).toStringAsFixed(0)}';
  }

  String get fractionalMilliseconds {
    int milliseconds = _currentTime.millisecond;
    double fractionalMillisecond = milliseconds / 1000;
    return fractionalMillisecond.toStringAsFixed(3);
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _currentTime = DateTime.now();
      _currentTimeUtc = DateTime.now().toUtc();
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
