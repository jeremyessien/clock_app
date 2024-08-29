import 'dart:developer';

import 'package:clock_app/providers/leap_year_provider.dart';
import 'package:clock_app/ui/analog_clock_screen.dart';
import 'package:clock_app/providers/digital_clock_provider.dart';
import 'package:clock_app/ui/leap_year_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'digital_clock_screen.dart';

class ClockBody extends StatefulWidget {
  const ClockBody({Key? key}) : super(key: key);

  @override
  State<ClockBody> createState() => _ClockBodyState();
}

class _ClockBodyState extends State<ClockBody> {
  late DateTime _todayDate;
  late DateTime _previousFullMoon;
  late DateTime _nextFullMoon;

  @override
  void initState() {
    super.initState();
    _todayDate = DateTime(2024, 8, 29);
    _previousFullMoon = FullMoonDates.getPreviousFullMoon(_todayDate);
    _nextFullMoon = FullMoonDates.getNextFullMoon(_todayDate);
  }

  String _formatDate(DateTime date) {
    final monthNames = [
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
    final month = monthNames[date.month - 1];
    final day = date.day.toString().padLeft(2, '0');
    return '$month\n $day';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff2A2A28),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff2A2A28),
        leading: Icon(
          Icons.menu,
          color: Colors.brown.shade400,
        ),
        title: Text('Time',
            style: TextStyle(fontSize: 24, color: Colors.brown.shade400)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Divider(
            color: Colors.white,
            thickness: 0.5,
          ),
          Text(
            'CEST',
            style: TextStyle(fontSize: 16, color: Colors.brown.shade400),
          ),
          const DigitalClock(),
          Text(
            'ATOMIC TIME SYNCED',
            style: TextStyle(fontSize: 16, color: Colors.brown.shade400),
          ),
          const Divider(
            color: Colors.white,
            thickness: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 20),
                Consumer<DigitalClockProvider>(
                    builder: (context, digitalClockProvider, _) {
                  final time = digitalClockProvider.currentTimeUtc;
                  final hour = time.hour.toString().padLeft(2, '0');
                  final minute = time.minute.toString().padLeft(2, '0');
                  return Text(
                    '$hour:$minute\n UTC',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  );
                }),
                const SizedBox(width: 20),
                Container(
                  color: Colors.white,
                  width: 1,
                  height: 65,
                ),
                // Add spacing between text and clock widget
                Consumer<LeapYearClockProvider>(
                  builder: (context, leapYearProvider, _) {
                    final nextLeapYear = leapYearProvider.nextLeapYear;
                    log('nextLeapYear = $nextLeapYear');

                    return Row(
                      children: [
                        Column(
                          children: [
                            Center(
                              child: Text(
                                '$nextLeapYear',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            Text(
                              'NEXT LEAP YEAR',
                              style: TextStyle(
                                  color: Colors.brown.shade400, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        const LeapYearClock(),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 0.5,
          ),

          //THE ANALOG CLOCK WIDGET COMES HERE
          const AnalogClock(),

          //This widget is for the full moon with the first one being the current full moon and the 22 the next full moon.
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: _formatDate(_previousFullMoon),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.brown.shade400,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.brown.shade100,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: _formatDate(_nextFullMoon),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.brown.shade400,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class FullMoonDates {
  static DateTime getPreviousFullMoon(DateTime date) {
    // Assuming the last known full moon was around 1st August 2024 (approximate)
    DateTime lastKnownFullMoon = DateTime(2024, 8, 1);
    int lunarCycleDays = 29; // Approximate average days between full moons

    // Calculate previous full moon
    Duration difference = date.difference(lastKnownFullMoon);
    int fullMoonsPast = (difference.inDays / lunarCycleDays).floor();
    return lastKnownFullMoon
        .add(Duration(days: fullMoonsPast * lunarCycleDays));
  }

  static DateTime getNextFullMoon(DateTime date) {
    // Assuming the last known full moon was around 1st August 2024 (approximate)
    DateTime lastKnownFullMoon = DateTime(2024, 8, 1);
    int lunarCycleDays = 29; // Approximate average days between full moons

    // Calculate next full moon
    Duration difference = date.difference(lastKnownFullMoon);
    int fullMoonsFuture = (difference.inDays / lunarCycleDays).ceil();
    return lastKnownFullMoon
        .add(Duration(days: fullMoonsFuture * lunarCycleDays));
  }
}
