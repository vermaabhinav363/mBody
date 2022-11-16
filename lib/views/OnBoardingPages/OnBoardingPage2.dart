import 'package:alumni/views/OnBoardingPages/OnBoardingConstants.dart';
import 'package:flutter/material.dart';
import 'package:alumni/views/OnBoardingPages/OnBoardingPage3.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardingPage2 extends StatefulWidget {
  const OnBoardingPage2({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage2> createState() => _OnBoardingPage2State();
}




class _OnBoardingPage2State extends State<OnBoardingPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {

          if (details.delta.dx < 0) {
            if(Gender != "Null")
            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: OnBoardingPage3()));
            else{
              showAlertDialog(context,"Please select a category");
            }
          }

        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/OnBoardingPagesImages/image3.png'),
                  opacity: 0.8,
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
                      width: 19,
                    ),
                    Text(
                      'Help us know you better',
                      style:
                          GoogleFonts.nunito(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 38,
                ),
                Container(
                  child: Row(

                    children: [
                      SizedBox(width: 19,),
                      Text(
                        'How do you identify yourself?',
                        style:
                        GoogleFonts.nunito(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      Gender = "Male";
                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: OnBoardingPage3()));
                    });
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 35,
                    decoration: BoxDecoration(
                      color:
                      Gender != 'Male'?
                      Color(0x5DDBC7FF):
                      Color.fromRGBO(0, 0, 255, 0.2)
                      ,
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
                          'Male',
                          style:
                          GoogleFonts.nunito(fontSize: 20, color:
                          Colors.black
                          ),
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
                    setState(() { Gender = "Female"; });
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: OnBoardingPage3()));
                  },

                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 35,
                    decoration: BoxDecoration(
                      color: Gender != "Female"?Color(0x5DDBC7FF):Color.fromRGBO(0, 0, 255, 0.2),
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
                            'Female',
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
                    setState(() {Gender = "Others"; });
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: OnBoardingPage3()));
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 35,
                    decoration: BoxDecoration(

                      color: Gender != "Others" ? Color(0x5DDBC7FF) : Color.fromRGBO(0, 0, 255, 0.2),
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
                            'Others',
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
                    setState(() { Gender = "Prefer not to say"; });
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: OnBoardingPage3()));
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 35,
                    decoration: BoxDecoration(
                      color: Gender != "Prefer not to say" ? Color(0x5DDBC7FF) :Color.fromRGBO(0, 0, 255, 0.2) ,
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
                            'Prefer not to say',
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
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      backgroundColor: Colors.grey[100],
      title: Text("Hi there!"),
      content: Text(text),
      actions: [
        Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: 80,
            child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Text("OK"))
        )
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
