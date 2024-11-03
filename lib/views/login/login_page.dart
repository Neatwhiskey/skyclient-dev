import 'package:flutter/material.dart';
import 'package:skyclient/global/controllers/app_controller.dart';
import 'package:skyclient/global/nav/side_nav.dart';
import 'package:skyclient/global/nav/top_nav.dart';
import 'package:skyclient/views/login/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var image =
      Image(image: AssetImage('images/sky_blue.jpg'), fit: BoxFit.cover);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext builContext, BoxConstraints constraints) {
      AppController.viewConstraints = constraints;
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                  child: Text(
                "Sky Test",
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 3,
                  // fontFamily: GoogleFonts.alata().fontFamily,
                ),
              )),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(),
                    child: TopNav(),
                  ))
            ],
          ),
          centerTitle: true,
          toolbarHeight: 50,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SideNav(),
              const Expanded(
                flex: 5,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Center(child: LoginForm())]),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
            color: Colors.blue,
            height: 30,
            child: Center(
                child: Text(
              " (c) Sky Client 2024",
              style: TextStyle(color: Colors.white),
            ))),
      );
    });
  }
}
