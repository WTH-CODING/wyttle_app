import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wyttle_app/models/product.dart';
import 'package:wyttle_app/models/user.dart';
import 'package:wyttle_app/services/userservice.dart';
import 'package:wyttle_app/widgets/widget.dart';
import 'package:wyttle_app/widgets/CarouselProduct.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  static String id = "ProductDetailsScreen";
  Product product;

  ProductDetailsScreen({required this.product});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductDetailsScreen> {
  int numberOfReviews = 100;
  bool stockAvailable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30),
          Expanded(
            flex: 1,
            child: CustomIndicator(),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: widget.product.ratings.toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        glow: false,
                        ignoreGestures: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (value) {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '(${widget.product.numOfReviews + 1} Reviews)',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹${widget.product.price}',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      Text(
                        widget.product.stock > 0
                            ? 'Available in stock'
                            : 'Not available in stock',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.product.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 50,
          child: TextButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                backgroundColor: MaterialStateProperty.all(Color(0xff5680E9))),
            onPressed: () async {
              User user = await UserService.getUser();
              user.cart.add(
                Cart(
                  count: 1,
                  item: widget.product,
                ),
              );
              bool isUpdate =
                  await UserService.updateUser(jsonEncode(user.toJson()));
              if (isUpdate) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Product added successfully")));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Product addition failed")));
              }
            },
            child: Text(
              "Add To Cart",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
