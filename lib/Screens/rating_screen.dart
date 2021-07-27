import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingScreen extends StatefulWidget {
  static String id = "RatingScreen";
  final String productName;
  final String address;
  RatingScreen(this.address, this.productName);
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
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
        title: Text(
          'Review',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 100,
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: Image.network(widget.address),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.productName,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RatingBar.builder(
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          glow: false,
                          ignoreGestures: false,
                          itemCount: 5,
                          itemSize: 20,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (value) {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: TextField(
                // controller: _controller,
                textCapitalization: TextCapitalization.sentences,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Review title",
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
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
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: TextField(
                minLines: 10,
                maxLines: 12,
                textCapitalization: TextCapitalization.sentences,
                style: TextStyle(color: Colors.black, fontSize: 13),
                decoration: InputDecoration(
                  hintText: "Review description",
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                ),
                cursorColor: Theme.of(context).disabledColor,
                onChanged: (String value) {},
                onSubmitted: (value) {
                  // if (!(value?.trim()?.isEmpty ?? true)) {
                  //   Navigator.pop(context);
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
