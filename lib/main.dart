import 'package:clock_app/enum.dart';
import 'package:clock_app/homepage.dart';
import 'package:clock_app/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ClockApp());
}

// ignore: use_key_in_widget_constructors
class ClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(create: (BuildContext context) {MenuInfo(MenuType.clock);  },
      child: HomePage())
    );
  }
}
