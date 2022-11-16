import 'package:alumni/helper/Helperfunction.dart';
import 'package:alumni/helper/constants.dart';
import 'package:alumni/services/auth.dart';
import 'package:alumni/services/database.dart';
import 'package:alumni/views/HomePage/HomePage.dart';
import 'package:alumni/views/SignIn_SignUp/ForgotPassword.dart';
import 'package:alumni/views/SignIn_SignUp/SignUp.dart';
import 'package:alumni/views/SignIn_SignUp/Verify.dart';
import 'package:alumni/widget/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

void initState() {
  isLoading = false;
}

String text = "";
final formKey = GlobalKey<FormState>();
bool isLoading = false;
TextEditingController emailTextEditing = new TextEditingController();
TextEditingController passWordTextEditing = new TextEditingController();
AuthMethods authMethods = new AuthMethods();
DatabaseMethods databaseMethods = new DatabaseMethods();

class _SignInState extends State<SignIn> {
  signMeIN() async {
    FirebaseApp app = await Firebase.initializeApp();

    setState(() {
      isLoading = true;
    });
    authMethods
        .signInWithEmail(
            emailTextEditing.text.replaceAll(" ", ""), passWordTextEditing.text)
        .then((val) {
      if (val == null) {
        setState(() {
          text =
              "Wrong Credentials used or one or more text field is missing. Please try again. ";
          showAlertDialog(context);
          setState(() {
            isLoading = false;
          });
        });
      } else {
        HelperFunction.saveUserEmailSharedPreference(emailTextEditing.text);

        Navigator.of(context).popUntil((route) => route.isFirst);

        isLoading = false;
        User? user = FirebaseAuth.instance.currentUser;
        if (user!.emailVerified) {
          Constants.email = emailTextEditing.text;
          databaseMethods.getUserByEmail(Constants.email).then((str){
            Constants.myName = str.data.docs['name'] as String;
          });
          print(Constants.myName);
          print("hello");
          HelperFunction.saveUserLoggedInSharedPreference(true);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => HomePage()));
        } else {
          Constants.email = emailTextEditing.text;
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Verify()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            child: Container
              (
              color: Colors.white,

                child: Center(child: CircularProgressIndicator())),
          )
        : Scaffold(
        resizeToAvoidBottomInset :false,
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/OnBoardingPagesImages/image3.png'),
                    fit: BoxFit.cover
                )
              ),
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: 60,),
                      Container(
                        child: Text('MBody', style: GoogleFonts.satisfy(
                            fontSize: 48,
                            color: Colors.black),
                        ),),
                      SizedBox(height: 20,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children : [
                            SizedBox(width: 30,),
                            Container(
                              height: 30,
                              width: 30,
                              child: Image(
                                image: AssetImage('assets/OnBoardingPagesImages/pin.png'),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Text('Online Consultation with Experts', style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  color: Colors.black),),
                            ),
                          ]
                      ),
                      SizedBox(height: 20,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children : [
                            SizedBox(width: 30,),
                            Container(
                              height: 30,
                              width: 30,
                              child: Image(
                                image: AssetImage('assets/OnBoardingPagesImages/pin.png'),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Text('Free of Cost Consultation ', style: GoogleFonts.nunito(
                                  fontSize: 16,

                                  color: Colors.black),),
                            ),
                          ]
                      ),
                      SizedBox(height: 20,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children : [
                            SizedBox(width: 30,),
                            Container(
                              height: 30,
                              width: 30,
                              child: Image(
                                image: AssetImage('assets/OnBoardingPagesImages/pin.png'),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Expanded(
                                child: Text('Better your day with proper sleep and meditation',
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      color: Colors.black),),
                              ),
                            ),
                          ]
                      ),
                      SizedBox(height: 20,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children : [
                            SizedBox(width: 30,),
                            Container(
                              height: 30,
                              width: 30,
                              child: Image(
                                image: AssetImage('assets/OnBoardingPagesImages/pin.png'),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Expanded(
                                child: Text('Get the loopholes solved with our Mini-Guides',
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.nunito(
                                      fontSize: 16,

                                      color: Colors.black),),
                              ),
                            ),
                          ]
                      ),
                      SizedBox(
                        height: 75,
                      ),
                      Container(
                        child: Text("Let us log you in.", style: GoogleFonts.nunito(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        padding: EdgeInsets.all(40),
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 1.0
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.zero,
                          ),
                        ),

                        child: Column(
                            children :[
                              Row(children: [
                                Text("Sign-in", style: GoogleFonts.nunito(
                                    fontSize: 32,
                                    color: Colors.black),),
                              ],),
                              SizedBox(height: 30,),
                              Form(
                                key: formKey,
                                child: Column(
                                  children: [

                                    Container(
                                      child: TextFormField(
                                          validator: (val) {
                                            if (RegExp(
                                                r"^[A-Za-z0-9._%+-]+@hyderabad.bits-pilani.ac.in$")
                                                .hasMatch(val!)) {
                                              return null;
                                            } else {
                                              text += "Invalid email pattern.\n\n";
                                              return "";
                                            }
                                          },
                                          controller: emailTextEditing,
                                          style: simpleTextStyle(),
                                          decoration: Tex("Email")),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      child: TextFormField(
                                          obscureText: true,
                                          validator: (val) {
                                            if (val!.isEmpty || val.length < 6) {
                                              text += "Password has to be 6 chars long.";

                                              return "";
                                            } else {
                                              return null;
                                            }
                                          },
                                          controller: passWordTextEditing,
                                          style: simpleTextStyle(),
                                          decoration: Tex("Password")),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              RaisedButton(

                                  child: Text('Sign In'),
                                  onPressed: (){
                                    signMeIN();
                                  }
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (BuildContext context) => SignUp()));
                                    },
                                    child: Text("New user - Sign Up", style: GoogleFonts.nunito(
                                        fontSize: 14,
                                        color: Colors.red),),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30,),
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                ForgotPass()));
                                  },
                                  child: Text(
                                    "Forgot your logging details? Get help logging in.",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.purple,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),

                            ]

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      //title: Text(""),
      content: Text("$text"),
      actions: [],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
