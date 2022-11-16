import 'package:alumni/views/OnBoardingPages/OnBoardingConstants.dart';
import 'package:alumni/views/OnBoardingPages/OnBoardingPage2.dart';
import 'package:alumni/views/SignIn_SignUp/SignIn.dart';
import 'package:alumni/views/SignIn_SignUp/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardingPage3 extends StatefulWidget {
  const OnBoardingPage3({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage3> createState() => _OnBoardingPage3State();
}

class _OnBoardingPage3State extends State<OnBoardingPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
            if (details.delta.dx < 0) {
              if(Age == "Null"){
                showAlertDialog(context, "Please select a category");
              }
              else {
                Navigator.push(context, PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: Duration(milliseconds: 500),
                    child: SignUp()));
              }
            }
            else if (details.delta.dx > 0) {
              Navigator.push(context, PageTransition(
                  type: PageTransitionType.leftToRight,
                  child: OnBoardingPage2()));
            }
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/OnBoardingPagesImages/image2.png'),
                  colorFilter: ColorFilter.mode(Colors.red,BlendMode.hue),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 19,
                    ),
                    Text(
                      'Hi There!',
                      style:
                      GoogleFonts.nunito(fontSize: 36, color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width:  19,
                    ),
                    Text(
                      'Help us know you better',
                      style:
                      GoogleFonts.nunito(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(18),
                  child: Text(
                    'What Age range would you put yourself into?',
                    style:
                    GoogleFonts.nunito(fontSize: 20, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: (){
                    setState(() { Age = "18 - 22"; });
                    Navigator.push(context, PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: Duration(milliseconds: 500),
                    child: SignUp()));
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 35,
                    decoration: BoxDecoration(
                      color: Age != "18 - 22" ? Color(0xffffb8a2) : Color.fromRGBO(
                          245 , 138, 98, 1.0),
                      border: Border.all(
                          color: Colors.black, // Set border color
                          width: 1.0), // Set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Set rounded corner radius
                    ),
                    child:  Center(
                      child: Row(
                        children: [
                          SizedBox(width: 20,),
                          Text(
                            '18 - 22',
                            style:
                            GoogleFonts.nunito(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    setState(() { Age = "23 - 29"; });
                    Navigator.push(context, PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: Duration(milliseconds: 500),
                    child: SignUp()));
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 35,
                    decoration: BoxDecoration(
                      color:Age != "23 - 29"? Color(0xffffb8a2):Color.fromRGBO(
                          245 , 138, 98, 1.0),
                      border: Border.all(
                          color: Colors.black, // Set border color
                          width: 1.0), // Set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Set rounded corner radius
                    ),
                    child:  Center(
                      child: Row(
                        children: [
                          SizedBox(width: 20,),
                          Text(
                            '23 - 29',
                            style:
                            GoogleFonts.nunito(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    setState(() { Age = "30 - 60"; });
                    Navigator.push(context, PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: Duration(milliseconds: 500),
                    child: SignUp()));
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 35,
                    decoration: BoxDecoration(
                      color:Age != "30 - 60" ? Color(0xffffb8a2) : Color.fromRGBO(
                          245 , 138, 98, 1.0),
                      border: Border.all(
                          color: Colors.black, // Set border color
                          width: 1.0), // Set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Set rounded corner radius
                    ),
                    child:  Center(
                      child: Row(
                        children: [
                          SizedBox(width: 20,),
                          Text(
                            '30 - 60',
                            style:
                            GoogleFonts.nunito(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    setState(() { Age = "61+"; });
                    Navigator.push(context, PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: Duration(milliseconds: 500),
                    child: SignUp()));
                  },

                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 35,
                    decoration: BoxDecoration(
                      color: Age != "61+" ? Color(0xffffb8a2) : Color.fromRGBO(
                          245 , 138, 98, 1.0),
                      border: Border.all(
                          color: Colors.black, // Set border color
                          width: 1.0), // Set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Set rounded corner radius
                    ),
                    child:  Center(
                      child: Row(
                        children: [
                          SizedBox(width: 20,),
                          Text(
                            '61 and above',
                            style:
                            GoogleFonts.nunito(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );


  }
  showAlertDialog(BuildContext context, String text) {
    AlertDialog alert = AlertDialog(
      title: Text("Hi there!"),
      content: Text(text),
      actions: [
        IconButton(onPressed: (){Navigator.pop(context);}, icon: Text("Ok"))
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
