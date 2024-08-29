import 'package:clock_app/providers/digital_clock_provider.dart';
import 'package:clock_app/providers/leap_year_provider.dart';
import 'package:clock_app/ui/clock_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DigitalClockProvider()),
        ChangeNotifierProvider(create: (_)=> LeapYearClockProvider(currentYear: 2024) )
      ],
      child: MaterialApp(
        title: 'Clock app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Color(0xff4E4437)),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff2A2A28)),
          useMaterial3: true,
        ),
        home: const ClockBody(),
      ),
    );
  }
}
