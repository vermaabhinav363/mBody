import 'package:alumni/views/SignUp.dart';
import 'package:alumni/views/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class introduct extends StatefulWidget {
  const introduct({Key? key}) : super(key: key);

  @override
  _introductState createState() => _introductState();
}

class _introductState extends State<introduct> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(330.0),
            child: AppBar(
              toolbarHeight: 330,
              centerTitle: true,
              title: Container(
                height: 250,
                  child: Lottie.network(
                      "https://assets9.lottiefiles.com/packages/lf20_nk5g0wbx.json")),
              backgroundColor: Color(0xffE6E6FA),
              elevation: 0,
              bottom: TabBar(
                  labelColor: Color(0xffb000080),
                  unselectedLabelColor: Color(0xffb000080),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: Colors.white),
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("SIGN IN"),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("SIGN UP"),
                      ),
                    ),
                  ]),
            ),
          ),
          body: TabBarView(children: [
            SignIn(),
            signUp(),
          ]),
        ));
  }
}
