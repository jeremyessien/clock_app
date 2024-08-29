import 'package:clock_app/providers/digital_clock_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DigitalClock extends StatelessWidget {
  const DigitalClock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DigitalClockProvider>(
      builder: (context, clockProvider, child) {
        final time = clockProvider.currentTime;
        final hour = time.hour.toString().padLeft(2, '0');
        final minute = time.minute.toString().padLeft(2, '0');

        final isAM = time.hour < 12;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
                    children: [
            Column(
            
              children: [
              Text(
                'AM',
                style: TextStyle(
                  color: isAM ? Colors.white :  Colors.brown.shade100,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                'PM',
                style: TextStyle(
                  color: !isAM ? Colors.white :  Colors.brown.shade400,
                  fontSize: 12,
                ),
              ),
            ]),
            const SizedBox(width: 10),
            Text(
              '$hour:$minute',
              style: const TextStyle(color: Color(0xffEFEFED), fontSize: 65, fontWeight: FontWeight.w300),
            ),
            const SizedBox(width: 10),
            Column(children: [
              Text(
                clockProvider.fractionalSeconds,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                '+${clockProvider.fractionalMilliseconds}',
                style:  TextStyle(
                  color:  Colors.brown.shade400,
                  fontSize: 14,
                ),
              ),
            ]),
          ],
        );
      },
    );
  }
}
