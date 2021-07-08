import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wyttle_app/Screens/landing_screen.dart';
import 'package:wyttle_app/Screens/login_screen.dart';
import 'package:wyttle_app/Screens/welcome_screen.dart';
import 'package:wyttle_app/services/authserice.dart';

class SplashScreen extends StatefulWidget {
  static String id = "Splashscreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(milliseconds: 1600);
    return new Timer(duration, navigate);
  }

  void navigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var auth = json.decode(prefs.getString("auth").toString());
    // ignore: unnecessary_null_comparison
    if (auth == null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    } else {
      bool verify = await AuthService.checkToken(context);
      if (verify) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LandingScreen(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 14,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Group 1.png",
                    height: 200,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Made with ❤ By Team 15",
              style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
