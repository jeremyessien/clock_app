import 'package:clock_app/providers/leap_year_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeapYearClock extends StatelessWidget {
  const LeapYearClock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LeapYearClockProvider>(
      builder: (context, leapYearProvider, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Compass Points
            const Positioned(
              left: 0,
              child: Text(
                'L',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const Positioned(
              top: 0,
              child: Text(
                '1',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const Positioned(
              right: 0,
              child: Text(
                '2',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const Positioned(
              bottom: 0,
              child: Text(
                '3',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            // Arrow
            Padding(
              padding: const EdgeInsets.all(23.0),
              child: Transform.rotate(
                angle: (leapYearProvider.arrowPosition * (2 * 3.1415927 / 4)) -
                    (3.1415927 / 4),
                child: const Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
