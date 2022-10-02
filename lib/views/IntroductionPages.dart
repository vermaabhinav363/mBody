import 'package:alumni/views/Intro.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:hive/hive.dart';


class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('');

    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            titleWidget: Container(

            ),
            bodyWidget: Container(),
            decoration: const PageDecoration(
              pageColor: Color(0x333D79FF),
              contentMargin: EdgeInsets.only(),
            ),
            reverse: true,
          ),
          PageViewModel(
              titleWidget: Container(),
              bodyWidget: Container(),
              decoration: const PageDecoration(
                pageColor: Colors.black,
                contentMargin: EdgeInsets.only(),
              ),
              reverse: true),
          PageViewModel(
              titleWidget: Container(),
              bodyWidget: Container(),
              decoration: const PageDecoration(
                pageColor: Colors.black,
                contentMargin: EdgeInsets.only(),
              ),
              reverse: true),
          PageViewModel(
              titleWidget: Container(),
              bodyWidget: Container(),
              decoration: const PageDecoration(
                pageColor: Colors.black,
                contentMargin: EdgeInsets.only(),
              ),
              reverse: true),

        ],
        onDone: () {
          box.put('introduction', false);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const introduct();
              },
            ),
          );
        },
        next: const Icon(Icons.forward,color: Colors.purpleAccent,),
        done: const Text("Done",
            style:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.purpleAccent)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.purple,
            color: Colors.purple,
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
