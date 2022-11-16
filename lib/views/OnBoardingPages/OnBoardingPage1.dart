import 'dart:async';

import 'package:flutter/material.dart';
import 'package:alumni/views/OnBoardingPages/OnBoardingPage2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';


class OnBoardingPage1 extends StatefulWidget {
  const OnBoardingPage1({Key? key}) : super(key: key);

  @override

  State<OnBoardingPage1> createState() => _OnBoardingPage1State();
}


class _OnBoardingPage1State extends State<OnBoardingPage1> {


  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(milliseconds: 2000), () {
    //   Navigator.push(context, PageTransition(type: PageTransitionType.fade, duration: Duration(seconds: 1), child: OnBoardingPage2()));
    //
    // });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 138 , 0, 0.35),
                Color.fromRGBO(255, 138 , 0, 0.16),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
        ),
        child: GestureDetector(
          onPanUpdate: (details) {
            Navigator.push(context, PageTransition(duration:Duration(seconds: 1), type: PageTransitionType.fade, child: OnBoardingPage2()),);
            // Swiping in left direction.
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 100,),
                      Transform.rotate(
                        angle: 0.0,
                        child: Container(
                          height: 260,
                          child:

                          Image(
                            image: AssetImage('assets/OnBoardingPagesImages/Logo1.png'),
                          )
                        ),
                      ),
                      Center(child: Text('MBody', style: GoogleFonts.satisfy(
                          fontSize: 76,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),)),
                      Text('Your happiness is our fortress!', style: GoogleFonts.nunito(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[800]),)
                    ],
                  ),
                ),
                SizedBox(height: 200,),
                Text('Ver 1.0.0'),

              ],
            ),
          ),
        ),
      ),
    );

  }


}
