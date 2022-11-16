import 'package:alumni/services/database.dart';
import 'package:alumni/views/ExpertPage/ExpertPage.dart';
import 'package:alumni/views/SleepModules/Sleep_Audiobooks.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  DatabaseMethods dataBaseMethod = new DatabaseMethods();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: SideDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.perm_identity_outlined,
              color: Colors.black,
            ),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(
              Icons.add_alert,
              color: Colors.red,
            ),
            onPressed: () {
              // do something
            },
          ),

        ],
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 224, 188, 0.25),

      ),
      body:  Container(
        decoration: BoxDecoration(
         color: Color.fromRGBO(255, 224, 188, 0.25),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15,),
                         Container(
                           height:90,
                           width: 90,
                           child: Image(
                               image: AssetImage('assets/HomePage/UserImage/UserNew.png'),
                           ),
                         ),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hello ' + 'There !', style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  color: Colors.black),),
                              SizedBox(height: 10,),
                              Text('Let’s explore your happy space', style: GoogleFonts.nunito(
                                  fontSize: 14,

                                  color: Colors.black),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text('Self-Assessment', style: GoogleFonts.nunito(
                              fontSize: 20,
                              color: Colors.black),),
                        ],
                      ),

                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 224, 188, 0.45),
                          border: Border.all(
                              width: 1.0
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(5.0) //                 <--- border radius here
                          ),
                        ),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                          children: [
                            CircularPercentIndicator(
                              backgroundColor: Colors.brown,
                              radius: 40.0,
                              lineWidth: 5.0,
                              percent: 0.3,
                              center: Container(

                              child: Text('70%',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                              ),
                              progressColor: Colors.brown[300]
                            ),
                            Container(

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center


                                ,
                                children: [
                                  Text('You achieved 70% !', style: GoogleFonts.nunito(
                                      fontSize: 15,
                                      color: Colors.black),),
                                  SizedBox(height: 5,),
                                  Text('Want to assess again?', style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        color: Colors.brown),),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 25,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text('For your personal care', style: GoogleFonts.nunito(
                              fontSize: 20,
                              color: Colors.black),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(width: 10,),
                            GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) => SleepAudiobooks()));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/HomePage/SleepingImage.jpg'),
                                        ),
                                        border: Border.all(
                                            width: 1.0
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0) //                 <--- border radius here
                                        ),
                                      ),
                                      height: 100,width: 100,
                                    ),
                                    SizedBox(height: 10,),
                                    Text('Sleep Cycle', style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        color: Colors.black),),
                                  ],
                                )
                            ),
                            SizedBox(width: 15,),
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/HomePage/YogaImage.png'),
                                      opacity: 0.7
                                    ),
                                    border: Border.all(
                                        width: 1.0
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0) //                 <--- border radius here
                                    ),
                                  ),
                                  height: 100,width: 100,
                                ),
                                SizedBox(height: 10,),
                                Text('Yog-astra', style: GoogleFonts.nunito(
                                    fontSize: 15,
                                    color: Colors.black),),
                              ],
                            ),
                            SizedBox(width: 15,),
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/HomePage/ReadingBook.png'),
                                    ),
                                    border: Border.all(
                                        width: 1.0
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0) //                 <--- border radius here
                                    ),
                                  ),
                                  height: 100,width: 100,
                                ),
                                SizedBox(height: 10,),
                                Text('Pocket Guides', style: GoogleFonts.nunito(
                                    fontSize: 15,
                                    color: Colors.black),),
                              ],
                            ),
                            SizedBox(width: 10,),

                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text('Forever Friends', style: GoogleFonts.nunito(
                              fontSize: 20,
                              color: Colors.black),),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 224, 188, 0.45),
                          border: Border.all(
                              width: 1.0
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(5.0) //                 <--- border radius here
                          ),
                        ),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage('assets/HomePage/Doctor.png'),
                                height: 100,
                              ),
                              Container(

                                child: Column(
                                  children: [
                                    Text('Contact Mental Health Experts', style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        color: Colors.black),),
                                    SizedBox(height: 5,),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push
                                          (
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext context) => ExpertPage()));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 1.0
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0) //                 <--- border radius here
                                          ),
                                        ),
                                        child: Text('Talk Now!', style: GoogleFonts.nunito(
                                            fontSize: 15,
                                            color: Colors.black),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),




                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );


  }
}
class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(

                  ),
                  child: Text(
                    'Buy and Sell @BPHC',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              decoration: BoxDecoration(

                  color: Color(0xffbA9A9A9),
                  image: new DecorationImage(
                    image: new AssetImage("assets/images/BPHC.jpg"),
                    fit: BoxFit.cover ,
                  )
              ),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Host an ad'),
              onTap: () => {

              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Shop'),
              onTap: () => {

              },
            ),
            ListTile(
              leading: Icon(Icons.storage),
              title: Text('See my ads'),
              onTap: () => {

              },

            ),
            Divider(height: 20,
                thickness: 4,
                indent: 8,
                endIndent: 8,
                color: Color(0xffbA9A9A9)),
            ListTile(
              leading: Icon(Icons.east),
              title: Text('Set course for Swap'),
              onTap: () => {

              },

            ),
            ListTile(
              leading: Icon(Icons.west),
              title: Text('Search course for Swap'),
              onTap: () => {

              },

            ),
          ],
        ),
      ),
    );
  }
}