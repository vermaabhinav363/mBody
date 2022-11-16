import 'package:alumni/views/SleepModules/SleepMusicPlayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'dart:typed_data';


class SleepAudiobooks extends StatefulWidget {
  const SleepAudiobooks({Key? key}) : super(key: key);

  @override
  State<SleepAudiobooks> createState() => _SleepAudiobooksState();
}

class _SleepAudiobooksState extends State<SleepAudiobooks> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [

            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff342F66),
                    Color(0xff342F66),
                    Color(0xff342F66),
                    Colors.white
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              ),
              child: Column(
                children: [
                  Container(
                      height: 250,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Image(
                        image: AssetImage('assets/SleepPages/image 6.png')
                        ,)
                  ),
                  Container(
                    child: Text('Time for bed!', style: GoogleFonts.nunito(
                        fontSize: 25,
                        color: Colors.white),)
                  ),
                  SizedBox(height: 10,),
                  Container(
                      child: Text('Time to sleep, time to dream', style: GoogleFonts.nunito(
                          fontSize: 20,
                          color: Colors.white),)
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                        decoration: BoxDecoration(
                          color: Color(0xffF2BA3F),
                          border: Border.all(
                              width: 1.0
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(8.0) //                 <--- border radius here
                          ),
                        ),
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: Center(
                            child: Text('Audiobooks', style: GoogleFonts.nunito(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                        decoration: BoxDecoration(
                          color: Color(0xccf2ba3f),
                          border: Border.all(
                              width: 1.0
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(8.0) //                 <--- border radius here
                          ),
                        ),
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: Center(
                            child: Text('Music', style: GoogleFonts.nunito(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        decoration:  BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff342F66),
                              Colors.white
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          border: Border.all(
                              width: 1.0,
                              color: Colors.white
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.zero,
                          ),
                        ),
                        child: ListView(
                          padding: const EdgeInsets.all(8),
                          children: <Widget>[
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Color(0xff342F66),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15.0) //                 <--- border radius here
                                  ),
                                  border: Border.all(width: 1)
                              ),
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Text("15 min", style: TextStyle(fontSize: 14,color: Colors.white),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                      child: Row(
                                        children: [
                                          SizedBox(width: 26,),
                                          Column(
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(height: 10,),
                                                  Text('Atonement', style: GoogleFonts.nunito(
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                  ),
                                                  Text('By Lan Mcewan', style: GoogleFonts.nunito(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                  ),
                                                  SizedBox(height: 26,),
                                                  Container(
                                                    padding:
                                                    EdgeInsets.fromLTRB(7, 5, 7, 5),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffF2BA3F),
                                                      border: Border.all(width: 1.0),
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(
                                                              15.0) //                 <--- border radius here
                                                      ),
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push
                                                          (
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (BuildContext context) => MusicPlayer()));
                                                      },
                                                      child:  Text('Play Now', style: GoogleFonts.nunito(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                            ],
                                          ),
                                          SizedBox(width: 14,),
                                          Image(
                                              height: 120,
                                              width: 120,
                                              image: AssetImage('assets/SleepPages/AtonementGirl1.png')
                                          )
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Color(0xff342F66),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15.0) //                 <--- border radius here
                                  ),
                                  border: Border.all(width: 1)
                              ),
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Text("15 min", style: TextStyle(fontSize: 14,color: Colors.white),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                      child: Row(
                                        children: [
                                          SizedBox(width: 26,),
                                          Column(
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(height: 10,),
                                                  Text('Atonement', style: GoogleFonts.nunito(
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                  ),
                                                  Text('By Lan Mcewan', style: GoogleFonts.nunito(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                  ),
                                                  SizedBox(height: 26,),
                                                  Container(
                                                    padding:
                                                    EdgeInsets.fromLTRB(7, 5, 7, 5),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffF2BA3F),
                                                      border: Border.all(width: 1.0),
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(
                                                              15.0) //                 <--- border radius here
                                                      ),
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push
                                                          (
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (BuildContext context) => MusicPlayer()));
                                                      },
                                                      child:  Text('Play Now', style: GoogleFonts.nunito(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                            ],
                                          ),
                                          SizedBox(width: 14,),
                                          Image(
                                              height: 120,
                                              width: 120,
                                              image: AssetImage('assets/SleepPages/AtonementGirl1.png')
                                          )
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Color(0xff342F66),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15.0) //                 <--- border radius here
                                  ),
                                  border: Border.all(width: 1)
                              ),
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Text("15 min", style: TextStyle(fontSize: 14,color: Colors.white),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                      child: Row(
                                        children: [
                                          SizedBox(width: 26,),
                                          Column(
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(height: 10,),
                                                  Text('Atonement', style: GoogleFonts.nunito(
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                  ),
                                                  Text('By Lan Mcewan', style: GoogleFonts.nunito(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                  ),
                                                  SizedBox(height: 26,),
                                                  Container(
                                                    padding:
                                                    EdgeInsets.fromLTRB(7, 5, 7, 5),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffF2BA3F),
                                                      border: Border.all(width: 1.0),
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(
                                                              15.0) //                 <--- border radius here
                                                      ),
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push
                                                          (
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (BuildContext context) => MusicPlayer()));
                                                      },
                                                      child:  Text('Play Now', style: GoogleFonts.nunito(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                            ],
                                          ),
                                          SizedBox(width: 14,),
                                          Image(
                                              height: 120,
                                              width: 120,
                                              image: AssetImage('assets/SleepPages/AtonementGirl1.png')
                                          )
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                  )
                ],
              ),
            )
          ],
        ),
    );
  }
}
