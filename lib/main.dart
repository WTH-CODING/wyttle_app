import 'package:flutter/material.dart';
import 'package:wyttle_app/Screens/myorders_screen.dart';
import 'package:wyttle_app/Screens/product_details.dart';
import 'package:wyttle_app/Screens/product_screen.dart';
import 'package:wyttle_app/Screens/wishlist_screen.dart';
import 'Screens/welcome_screen.dart';
import 'Screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: MyOrdersScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          CartScreen.id: (context) => CartScreen(),
          ProductDetailsScreen.id: (context) => ProductDetailsScreen(),
          ProductScreen.id: (context) => ProductScreen(),
          MyOrdersScreen.id: (context) => MyOrdersScreen(),
          WishlistScreen.id: (context) => WishlistScreen(),
        });
  }
}
