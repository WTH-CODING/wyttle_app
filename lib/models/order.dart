// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:wyttle_app/models/user.dart';

List<Order> orderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
    Order({
        required this.shippingInfo,
        required this.isPaid,
        required this.itemsPrice,
        required this.shippingPrice,
        required this.totalPrice,
        required this.id,
        required this.user,
        required this.orderItems,
        required this.transactionId,
        required this.orderStatus,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final ShippingInfo shippingInfo;
    final bool isPaid;
    final int itemsPrice;
    final int shippingPrice;
    final int totalPrice;
    final String id;
    final User user;
    final List<OrderItem> orderItems;
    final String transactionId;
    final String orderStatus;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        shippingInfo: ShippingInfo.fromJson(json["shippingInfo"]),
        isPaid: json["isPaid"],
        itemsPrice: json["itemsPrice"],
        shippingPrice: json["shippingPrice"],
        totalPrice: json["totalPrice"],
        id: json["_id"],
        user: User.fromJson(json["user"]),
        orderItems: List<OrderItem>.from(json["orderItems"].map((x) => OrderItem.fromJson(x))),
        transactionId: json["transactionId"],
        orderStatus: json["orderStatus"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "shippingInfo": shippingInfo.toJson(),
        "isPaid": isPaid,
        "itemsPrice": itemsPrice,
        "shippingPrice": shippingPrice,
        "totalPrice": totalPrice,
        "_id": id,
        "user": user.toJson(),
        "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
        "transactionId": transactionId,
        "orderStatus": orderStatus,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class OrderItem {
    OrderItem({
        required this.id,
        required this.item,
        required this.count,
    });

    final String id;
    final Item item;
    final int count;

    factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["_id"],
        item: Item.fromJson(json["item"]),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "item": item.toJson(),
        "count": count,
    };
}

class Item {
    Item({
        required this.price,
        required this.ratings,
        required this.numOfReviews,
        required this.stock,
        required this.id,
        required this.name,
        required this.description,
        required this.imageurl,
        required this.category,
        required this.reviews,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final int price;
    final int ratings;
    final int numOfReviews;
    final int stock;
    final String id;
    final String name;
    final String description;
    final String imageurl;
    final String category;
    final List<dynamic> reviews;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        price: json["price"],
        ratings: json["ratings"],
        numOfReviews: json["numOfReviews"],
        stock: json["stock"],
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        imageurl: json["imageurl"],
        category: json["category"],
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "price": price,
        "ratings": ratings,
        "numOfReviews": numOfReviews,
        "stock": stock,
        "_id": id,
        "name": name,
        "description": description,
        "imageurl": imageurl,
        "category": category,
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class ShippingInfo {
    ShippingInfo({
        required this.address,
        required this.phoneNo,
    });

    final String address;
    final String phoneNo;

    factory ShippingInfo.fromJson(Map<String, dynamic> json) => ShippingInfo(
        address: json["address"],
        phoneNo: json["phoneNo"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "phoneNo": phoneNo,
    };
}

