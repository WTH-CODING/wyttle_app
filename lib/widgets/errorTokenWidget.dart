

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wyttle_app/Screens/login_screen.dart';
import 'package:wyttle_app/services/authserice.dart';

tokenErrorWiget(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Text("Your session is expired please login again!!!"),
      actions: [
        MaterialButton(
          child: Text("ok"),
          onPressed: () async {
            AuthService.clearAuth();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool("login", false);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
        ),
      ],
    ),
  );
}