import 'package:flutter/material.dart';
import 'package:wyttle_app/widgets/widget.dart';

class WishlistScreen extends StatefulWidget {
  static String id = "WishlistScreen";

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<String> address = [
    "random_images/3.jpg",
    "random_images/2.jpg",
    "random_images/1.jpg",
    "random_images/0.jpg",
    "random_images/3.jpg",
    "random_images/2.jpg",
    "random_images/1.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: Container(
        color: Colors.blueGrey[50],
        child: GridView.builder(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 1,
              mainAxisSpacing: 2,
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.5),
            ),
            itemCount: address.length,
            itemBuilder: (context, index) {
              return ProductView(address[index]);
            }),
      ),
    );
  }
}
