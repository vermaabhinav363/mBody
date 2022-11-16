import 'package:alumni/views/ExpertPage/ExpertPage.dart';
import 'package:alumni/views/HomePage/HomePage.dart';
import 'package:alumni/views/MyAd.dart';
import 'package:alumni/views/OnBoardingPages/OnBoardingPage1.dart';
import 'package:alumni/views/OnBoardingPages/OnBoardingPage2.dart';
import 'package:alumni/views/SearchOrAddItems.dart';
import 'package:alumni/views/SignIn_SignUp/SignIn.dart';
import 'package:alumni/views/SignIn_SignUp/SignUp.dart';
import 'package:alumni/views/SleepModules/SleepMusicPlayer.dart';
import 'package:flutter/material.dart';


void main() async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/signUp': (context) => SignUp(),
        '/signIN': (context) => SignIn(),
        '/MyAd': (context) => MyAd(),
        '/Search': (context) => SearchAdd(),
      },
      title: 'mBody',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: OnBoardingPage1()
    );
  }
}
