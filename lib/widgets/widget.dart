import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  MainButton(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
            backgroundColor: MaterialStateProperty.all(Color(0xff5680E9))),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
