// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:wyttle_app/models/product.dart';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.isverified,
    required this.blocked,
    required this.photoUrl,
    required this.numOfCoins,
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.cart,
    required this.wishlist,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.address,
    required this.phone,
  });

  bool isverified;
  bool blocked;
  String photoUrl;
  int numOfCoins;
  String id;
  String name;
  String email;
  String password;
  List<Cart> cart;
  List<Wishlist> wishlist;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String address;
  String phone;

  factory User.fromJson(Map<String, dynamic> json) => User(
       id: json["_id"] == null ? "null" : json["_id"],
        isverified: json["isverified"] == null ? "null" : json["isverified"],
        blocked: json["blocked"] == null ? "null" : json["blocked"],
        photoUrl: json["photoUrl"] == null ? "null" : json["photoUrl"],
        numOfCoins: json["numOfCoins"] == null ? "null" : json["numOfCoins"],
        name: json["name"] == null ? "null" : json["name"],
        email: json["email"] == null ? "null" : json["email"],
        password: json["password"] == null ? "null" : json["password"],
        cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
        wishlist: List<Wishlist>.from(
            json["wishlist"].map((x) => Wishlist.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
         v: json["__v"] == null ? "null" : json["__v"],
        address: json["address"] == null ? "null" : json["address"],
        phone: json["phone"]  == null ? "" : json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "isverified": isverified,
        "blocked": blocked,
        "photoUrl": photoUrl,
        "numOfCoins": numOfCoins,
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
        "wishlist": List<dynamic>.from(wishlist.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "address": address,
        "phone": phone,
      };
}

class Cart {
  Cart({
    this.id,
    required this.item,
    required this.count,
  });

  String? id;
  Product item;
  int count;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["_id"],
        item: Product.fromJson(json["item"]),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "item": item,
        "count": count,
      };
}

class Wishlist {
  Wishlist({
    required this.id,
    required this.item,
  });

  String id;
  Product item;

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["_id"],
        item: Product.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "item": item,
      };
}
