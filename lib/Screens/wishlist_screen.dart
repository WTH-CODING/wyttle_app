import 'package:flutter/material.dart';
import 'package:wyttle_app/models/user.dart';
import 'package:wyttle_app/services/userservice.dart';
import 'package:wyttle_app/widgets/widget.dart';

class WishlistScreen extends StatefulWidget {
  static String id = "WishlistScreen";

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  bool loader = false;
  late User user;

  getData() async {
    setState(() {
      loader = true;
    });
    user = await UserService.getUser();
    setState(() {
      loader = false;
    });
  }

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
    return loader
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            body: Container(
              color: Colors.blueGrey[50],
              child: GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 8,
                    crossAxisCount: 8,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.5),
                  ),
                  itemCount: user.wishlist.length,
                  itemBuilder: (context, index) {
                    return ProductView(product: user.wishlist[index].item);
                  }),
            ),
          );
  }
}
