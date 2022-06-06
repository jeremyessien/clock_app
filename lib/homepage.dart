// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, override_on_non_overriding_member, prefer_const_constructors_in_immutables
import 'package:clock_app/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime now = DateTime.now();
  var formattedTime = DateFormat('HH:mm').format(DateTime.now());
  var formattedDate = DateFormat('EE, d MMM').format(DateTime.now());
  var timeZone = DateTime.now().timeZoneOffset.toString().split('.').first;
  var offsetSign = '+';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerBackground,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.h,),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MenuButton('Clock', 'images/clock_icon.png'),
                  MenuButton('Clock', 'images/alarm_icon.png'),
                  MenuButton('Timer', 'images/timer_icon.png'),
                  MenuButton('Stopwatch', 'images/stopwatch_icon.png'),
                ],
              ),
              VerticalDivider(
                color: Colors.white,
                width: 1,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          'Clock',
                          style: TextStyle(
                            color: kOutlineBrushColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formattedTime,
                            style: TextStyle(
                              color: kOutlineBrushColor,
                              fontSize: 60,
                            ),
                          ),
                          Text(
                            formattedDate,
                            style: TextStyle(
                              color: kOutlineBrushColor,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: Align(
                          alignment: Alignment.center,
                          child: ClockView(size: MediaQuery.of(context).size.height/4,),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Timezone',
                              style: TextStyle(
                                color: kOutlineBrushColor,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  color: kOutlineBrushColor,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'UTC' + offsetSign + timeZone,
                                  style: TextStyle(
                                    color: kOutlineBrushColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Padding MenuButton(String title, String image) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: TextButton(
      style: TextButton.styleFrom(
        primary: title == 'Clock' ? Colors.redAccent : Colors.transparent,
      ),
      onPressed: () {},
      child: Column(
        children: [
          Image.asset(
            image,
            scale: 1.5,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),

    ),
  );
}
