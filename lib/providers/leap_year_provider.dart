import 'package:flutter/material.dart';

class LeapYearClockProvider with ChangeNotifier {
  final int currentYear;
  late int nextLeapYear;
  late int arrowPosition; 

  LeapYearClockProvider({required this.currentYear}) {
    calculateNextLeapYear();
    calculateArrowPosition();
  }

  void calculateNextLeapYear() {
    nextLeapYear = currentYear + (4 - (currentYear % 4));
    if (nextLeapYear % 100 == 0 && nextLeapYear % 400 != 0) {
      nextLeapYear += 4;
    }
    notifyListeners();
  }

  void calculateArrowPosition() {
    int yearsToNextLeapYear = nextLeapYear - currentYear;
    arrowPosition = (yearsToNextLeapYear % 4 + 4) % 4; // Ensure positive position
    notifyListeners();
  }
}
