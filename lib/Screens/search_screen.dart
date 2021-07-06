import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wyttle_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static String id = "SearchScreen";
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[50],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          // controller: _controller,
          textCapitalization: TextCapitalization.sentences,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: "What do you want to buy?",
            hintStyle: TextStyle(color: Colors.black54),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
            ),
          ),
          cursorColor: Theme.of(context).disabledColor,
          onChanged: (String value) {},
          onSubmitted: (value) {
            // if (!(value?.trim()?.isEmpty ?? true)) {
            //   Navigator.pop(context);
            // }
          },
          autofocus: true,
        ),
        actions: [],
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Text(
            //   'SEE ALL',
            //   style: TextStyle(
            //       fontSize: 13, color: Theme.of(context).primaryColor),
            // ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 7),
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  IconAppBar(FontAwesomeIcons.tshirt, 10, (){}),
                  IconAppBar(FontAwesomeIcons.trophy, 10, (){}),
                  IconAppBar(FontAwesomeIcons.userShield, 10, (){}),
                  IconAppBar(FontAwesomeIcons.dumbbell, 10, (){}),
                  IconAppBar(FontAwesomeIcons.mars, 10, (){}),
                  IconAppBar(FontAwesomeIcons.venus, 10, (){}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
