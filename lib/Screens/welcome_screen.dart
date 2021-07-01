import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "WelcomeScreen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: IconAppBar(Icons.menu),
        ),
        actions: [IconButton(onPressed: () {}, icon: IconAppBar(Icons.search))],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home_filled,
                color: Colors.black45,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
              Icons.bookmark_add,
              color: Colors.black45,
              )
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
              Icons.shopping_cart_rounded,
              color: Colors.black45,
              )
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
              Icons.person,
              color: Colors.black45,
              ),
            ), 
          ],
        ),
      ),
    );
  }
}

class IconAppBar extends StatelessWidget {
  final IconData iconData;
  IconAppBar(this.iconData);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.black12,
        ),
        child: Icon(
          iconData,
          color: Colors.black,
        ));
  }
}
