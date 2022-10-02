import 'package:alumni/views/MyAd.dart';
import 'package:alumni/views/SearchOrAddItems.dart';
import 'package:alumni/views/SignIn.dart';
import 'package:alumni/views/SignUp.dart';
import 'package:alumni/views/IntroductionPages.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/signUp': (context) => signUp(),
        '/signIN': (context) => SignIn(),
        '/MyAd': (context) => MyAd(),
        '/Search': (context) => SearchAdd(),
      },
      title: 'mBody',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffE6E6FA),
        primarySwatch: Colors.purple,
      ),
      home: IntroductionPage(),
    );
  }
}
