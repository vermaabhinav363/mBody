import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'dart:typed_data';

import 'package:google_fonts/google_fonts.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

String printDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}
String audioasset = "assets/SleepPages/story2.mp3";
bool isplaying = false;
bool audioplayed = false;
late Uint8List audiobytes;
int duration =0;
Duration currentDuration = Duration(seconds: 0);
AudioPlayer player = AudioPlayer();
void LoadAudio() {
  Future.delayed(Duration.zero, () async {
    ByteData bytes = await rootBundle.load(audioasset);
    audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    duration = await player.getDuration();
  });
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  void initState() {
    LoadAudio();
    player.onPlayerStateChanged.listen((event) {
      print(event.toString());
    });
    player.onDurationChanged.listen((event) {
      print(event.toString());
    });
    player.onAudioPositionChanged.listen((event) {
      setState(() {currentDuration = event ;});
      print(event.toString());
    });
  }
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()  async {
        currentDuration = Duration(seconds: 0);
        player.stop();
        return true;
      },
      child: Scaffold(
        body: Container(
          color: Color(0xff342F66),
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/MusicPlayer/Atonement.png'),
                  )
                ),
              ),
              SizedBox(height: 50,),
              Text('Atonement', style: GoogleFonts.nunito(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              ),
              SizedBox(height: 50,),
              Slider(
                  max: 902,
                  min: 0,
                  value: currentDuration.inSeconds.toDouble(),
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                  onChanged: (value)async{
                    final position = Duration(seconds: value.toInt());
                    await player.seek(position);

                    await player.resume();
                    setState(() {
                      isplaying = true;
                      audioplayed = true;
                    });
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text('${printDuration(currentDuration)}', style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text('15:02', style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 20,),
                  Container(
                    child: IconButton(
                      onPressed: () async {
                        if(!isplaying && !audioplayed){
                          int result = await player.playBytes(audiobytes);
                          if(result == 1){ //play success
                            setState(() {
                              isplaying = true;
                              audioplayed = true;
                            });
                          }else{
                            print("Error while playing audio.");
                          }
                        }else if(audioplayed && !isplaying){
                          int result = await player.resume();
                          if(result == 1){ //resume success
                            setState(() {
                              isplaying = true;
                              audioplayed = true;
                            });
                          }else{
                            print("Error on resume audio.");
                          }
                        }else{
                          int result = await player.pause();
                          if(result == 1){ //pause success
                            setState(() {
                              isplaying = false;
                            });
                          }else{
                            print("Error on pause audio.");
                          }
                        }
                      },
                      icon: Icon(Icons.skip_previous_sharp,color: Colors.white,size: 36,),

                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(151, 151, 151, 0.21),
                      borderRadius: BorderRadius.all(
                          Radius.circular(50.0) //                 <--- border radius here
                      ),
                    ),
                    child: IconButton(
                      onPressed: () async {
                        if(!isplaying && !audioplayed){
                          int result = await player.playBytes(audiobytes);
                          if(result == 1){ //play success
                            setState(() {
                              isplaying = true;
                              audioplayed = true;
                            });
                          }else{
                            print("Error while playing audio.");
                          }
                        }else if(audioplayed && !isplaying){
                          int result = await player.resume();
                          if(result == 1){ //resume success
                            setState(() {
                              isplaying = true;
                              audioplayed = true;
                            });
                          }else{
                            print("Error on resume audio.");
                          }
                        }else{
                          int result = await player.pause();
                          if(result == 1){ //pause success
                            setState(() {
                              isplaying = false;
                            });
                          }else{
                            print("Error on pause audio.");
                          }
                        }
                      },
                      icon: Icon(isplaying?Icons.pause:Icons.play_arrow,color: Colors.white,size: 48,),

                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () async {
                        if(!isplaying && !audioplayed){
                          int result = await player.playBytes(audiobytes);
                          if(result == 1){ //play success
                            setState(() {
                              isplaying = true;
                              audioplayed = true;
                            });
                          }else{
                            print("Error while playing audio.");
                          }
                        }else if(audioplayed && !isplaying){
                          int result = await player.resume();
                          if(result == 1){ //resume success
                            setState(() {
                              isplaying = true;
                              audioplayed = true;
                            });
                          }else{
                            print("Error on resume audio.");
                          }
                        }else{
                          int result = await player.pause();
                          if(result == 1){ //pause success
                            setState(() {
                              isplaying = false;
                            });
                          }else{
                            print("Error on pause audio.");
                          }
                        }
                      },
                      icon: Icon(Icons.skip_next_sharp,color: Colors.white,size: 36,),

                    ),
                  ),
                  SizedBox(width: 20,),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
