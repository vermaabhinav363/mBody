import 'package:alumni/views/Conversation/Conversation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helper/constants.dart';

class ExpertPage extends StatefulWidget {
  const ExpertPage({Key? key}) : super(key: key);

  @override
  State<ExpertPage> createState() => _ExpertPageState();
}

class _ExpertPageState extends State<ExpertPage> {
  _makingPhoneCall(String str) async {
    var url = Uri.parse(str);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color.fromRGBO(255, 224, 188, 0.09),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/ExpertPage/HelpingHand.png'),
                        height: 150,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Relax, We’ve got your back!',
                          style: GoogleFonts.nunito(
                              fontSize: 24, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your concerns are ours to solve',
                          style: GoogleFonts.nunito(
                              fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        'Psychologist Consultation',
                        style: GoogleFonts.nunito(
                            fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffD9F6FF),
                        border: Border.all(width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(
                                5.0) //                 <--- border radius here
                            ),
                      ),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(30),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage('assets/ExpertPage/User.png'),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Column(
                                children: [
                                  Text(
                                    'Dr. Virinchi Sharma',
                                    style: GoogleFonts.nunito(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(7, 5, 7, 5),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          border: Border.all(width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  15.0) //                 <--- border radius here
                                              ),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            _makingPhoneCall(
                                                "tel://9024458477");
                                          },
                                          child: Icon(Icons.phone),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(7, 5, 7, 5),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          border: Border.all(width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  15.0) //                 <--- border radius here
                                              ),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            _makingPhoneCall(
                                                "tel://9024458477");
                                          },
                                          child: Text(
                                            'Chat Now!',
                                            style: GoogleFonts.nunito(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        'Visiting Psychiatrist Consultation',
                        style: GoogleFonts.nunito(
                            fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffD9F6FF),
                        border: Border.all(width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(
                                5.0) //                 <--- border radius here
                            ),
                      ),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(30),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage('assets/ExpertPage/User.png'),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Column(
                                children: [
                                  Text(
                                    'Dr. Gopinath Srinivasa',
                                    style: GoogleFonts.nunito(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding:
                                        EdgeInsets.fromLTRB(7, 5, 7, 5),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          border: Border.all(width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  15.0) //                 <--- border radius here
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            _makingPhoneCall(
                                                "tel://9024458477");
                                          },
                                          child: Icon(Icons.phone),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        padding:
                                        EdgeInsets.fromLTRB(7, 5, 7, 5),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          border: Border.all(width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  15.0) //                 <--- border radius here
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            _makingPhoneCall(
                                                "tel://9024458477");
                                          },
                                          child: Text(
                                            'Chat Now!',
                                            style: GoogleFonts.nunito(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
