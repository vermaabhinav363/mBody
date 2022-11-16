import 'dart:async';
import 'dart:ui';

import 'package:alumni/helper/Helperfunction.dart';
import 'package:alumni/helper/constants.dart';
import 'package:alumni/services/auth.dart';
import 'package:alumni/views/HomePage/HomePage.dart';
import 'package:alumni/views/SearchOrAddItems.dart';
import 'package:alumni/views/SignIn_SignUp/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

late User? user;
late var timer;
bool sent = false;
AuthMethods authMethods = new AuthMethods();

class _VerifyState extends State<Verify> {
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      user = FirebaseAuth.instance.currentUser;

      if (user!.emailVerified) {
        HelperFunction.saveUserLoggedInSharedPreference(true);

        timer.cancel();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      }
      checkEmailVerified();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 0, 46, 0.2),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 0, 46, 0.2),
                Color.fromRGBO(255, 0, 15, 0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: Text(
                    "An email has been sent to your account. Please verify the same to proceed. ",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                )),
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      print(user);
                      user!.sendEmailVerification();
                      showAlertDialog(context);
                    },
                    child: Text(
                      "Re Send ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user!.reload();
    user = FirebaseAuth.instance.currentUser;
    if (user!.emailVerified) {
    } else {
      if (!sent) {
        user!.sendEmailVerification();
        sent = true;
      }
    }
  }
}

showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Text("A verification email has been resent."),
    actions: [],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
