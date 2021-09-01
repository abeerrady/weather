

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/home_screens/view.dart';


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
Position currentLocation ;
Future<Position> locaterUser() async{
  return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}
getUserLoction () async {
  currentLocation = await locaterUser();
  setState(() {
    print(currentLocation.latitude);
    print(currentLocation.longitude);
  });
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoction();
    Future.delayed(Duration(seconds: 6) ,
        (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ViewScreen(currentLocation)));
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.network('https://i.pinimg.com/originals/03/46/bf/0346bfd0986cffdfdc19b48c5f548ca6.jpg' , fit: BoxFit.cover,),
    );
  }
}
