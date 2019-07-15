import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_car_rent_ui/Welcome.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/Welcome': (BuildContext context) => new Welcome()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

Color color1 = Color(0xFFC9903E);
Color color2 = Color(0xFFCEA05F);

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Welcome');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/logo_white.png'),
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: [color1, color2])),
    );
  }
}
