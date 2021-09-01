import 'package:flutter/material.dart';
import 'package:weather/splash/splash.dart';

import 'google_map/google_map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   debugShowCheckedModeBanner: false,
      home:SplashScreen() ,
    );
  }
}

