import 'package:alumni/services/auth.dart';
import 'package:alumni/services/database.dart';
import 'package:alumni/widget/widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

late String text;
TextEditingController EmailTextEditing = new TextEditingController();
AuthMethods authMethods = new AuthMethods();
DatabaseMethods databaseMethods = new DatabaseMethods();

class _ForgotPassState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromRGBO(255, 0, 46, 0.2),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromRGBO(255, 0, 46, 0.2),
            Color.fromRGBO(255, 0, 15, 0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    child: Text(
                      'Forgot Password',
                      style:
                          GoogleFonts.nunito(fontSize: 32, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    child: Text(
                      'Enter your E-mail address ',
                      style:
                          GoogleFonts.nunito(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                alignment: Alignment.center,
                child: TextField(
                    controller: EmailTextEditing, decoration: Tex("Email")),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 140,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0),
                    color: Color.fromRGBO(255, 0, 46, 0.2),
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () async {
                    FirebaseApp app = await Firebase.initializeApp();
                    if (EmailTextEditing.text != null) {
                      if (true) {
                        var v =
                            authMethods.resetPassword(EmailTextEditing.text);
                        print(v);
                        showAlertDialog(context, "Email has been sent");
                      } else {
                        showAlertDialog(context,
                            "Failed to sent recovery email. Please confirm whether you have registered or not. ");
                      }
                    } else {
                      showAlertDialog(context, "Text field empty. ");
                    }
                  },
                  child: Text(
                    "Send",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: Divider(color: Colors.black,thickness: 2,)
              ),

            ]),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String text) {
    AlertDialog alert = AlertDialog(
      content: Text(text),
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
