import 'package:alumni/helper/Helperfunction.dart';
import 'package:alumni/helper/constants.dart';
import 'package:alumni/services/auth.dart';
import 'package:alumni/services/database.dart';
import 'package:alumni/views/SignIn_SignUp/SignIn.dart';
import 'package:alumni/views/SignIn_SignUp/Verify.dart';
import 'package:alumni/widget/widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

late String SignUpEmail;
String text = "";
final formKey = GlobalKey<FormState>();
bool isLoading = false;
TextEditingController userNameTextEditing = new TextEditingController();
TextEditingController emailTextEditing = new TextEditingController();
TextEditingController passWordTextEditing = new TextEditingController();
AuthMethods authMethods = new AuthMethods();
DatabaseMethods databaseMethods = new DatabaseMethods();

class _SignUpState extends State<SignUp> {
  signMeUP() async {
    FirebaseApp app = await Firebase.initializeApp();
    text = "";
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      authMethods
          .signUpWithEnailandPassword(
              emailTextEditing.text.replaceAll(" ", ""), passWordTextEditing.text)
          .then((val) {
        if (val == null) {
          setState(() {
            text = "Email already in use";
            showAlertDialog(context);
            isLoading = false;
          });
        } else {

          Map<String, String> UserInfoMap = {
            "name": userNameTextEditing.text,
            "email": emailTextEditing.text
          };
          SignUpEmail = emailTextEditing.text;
          Constants.email = emailTextEditing.text;
          HelperFunction.saveUserEmailSharedPreference(emailTextEditing.text);
          HelperFunction.saveUserNameSharedPreference( emailTextEditing.text.substring(0, emailTextEditing.text.indexOf('@')));
          databaseMethods.uploadUserInfo(UserInfoMap);
          Navigator.of(context).popUntil((route) => route.isFirst);
          isLoading = false;
          Constants.myName =  userNameTextEditing.text;
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Verify()));
        }
      });
    }
    else{
      showAlertDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset :false,
      body: Container(
        child: isLoading
            ? Container(
                child: Center(child: CircularProgressIndicator()),
              )
            : Container(
             decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage('assets/OnBoardingPagesImages/imageSignIn.png'),
                  fit: BoxFit.cover
                )
               ),
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: SafeArea(
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
                              SizedBox(width: 10,),
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
                                SizedBox(width: 10,),
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
                                SizedBox(width: 10,),
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
                                SizedBox(width: 10,),
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
                            child: Text("You are ready to get started.", style: GoogleFonts.nunito(
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
                                  Text("Sign-up", style: GoogleFonts.nunito(
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
                                              if (val!.isEmpty ) {
                                                text = text +  "UserName can not be empty.\n\n";

                                                return "";
                                              } else {
                                                return null;
                                              }
                                            },
                                            controller: userNameTextEditing,
                                            style: simpleTextStyle(),
                                            decoration: Tex("UserName")),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        child: TextFormField(
                                            validator: (val) {
                                              if (RegExp(
                                                  r"^[A-Za-z0-9._%+-]+@hyderabad.bits-pilani.ac.in$")
                                                  .hasMatch(val!)) {
                                                return null;
                                              } else {
                                                text += "Use BITS Hyderabad email to register.\n\n";
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

                                    child: Text('Sign Up'),
                                    onPressed: (){
                                      signMeUP();
                                    }
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder: (BuildContext context) => SignIn()));
                                      },
                                      child: Text("Already a user - Sign In", style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          color: Colors.red),),
                                    ),
                                  ],
                                )

                              ]

                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    //title: Text(""),
    content: Text("$text"),
    actions: [

    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
