// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

import 'package:wyttle_app/models/product.dart';
import 'package:wyttle_app/models/user.dart';
List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    this.shippingInfo,
    this.isPaid,
    this.itemsPrice,
    this.shippingPrice,
    this.totalPrice,
    this.id,
    this.user,
    this.orderItems,
    this.transactionId,
    this.orderStatus,
     this.createdAt,
     this.updatedAt,
  });

  final ShippingInfo? shippingInfo;
  final bool? isPaid;
  final int? itemsPrice;
  final int? shippingPrice;
  final int? totalPrice;
  final String? id;
  final User? user;
  final List<OrderItem>? orderItems;
  final String? transactionId;
  final String? orderStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        shippingInfo: ShippingInfo.fromJson(json["shippingInfo"]),
        isPaid: json["isPaid"],
        itemsPrice: json["itemsPrice"],
        shippingPrice: json["shippingPrice"],
        totalPrice: json["totalPrice"],
        id: json["_id"],
        user: User.fromJson(json["user"]),
        orderItems: List<OrderItem>.from(
            json["orderItems"].map((x) => OrderItem.fromJson(x))),
        transactionId: json["transactionId"],
        orderStatus: json["orderStatus"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "shippingInfo": shippingInfo!.toJson(),
        "isPaid": isPaid,
        "itemsPrice": itemsPrice,
        "shippingPrice": shippingPrice,
        "totalPrice": totalPrice,
        "_id": id,
        "user": user!.toJson(),
        "orderItems": List<dynamic>.from(orderItems!.map((x) => x.toJson())),
        "transactionId": transactionId,
        "orderStatus": orderStatus,
      };
}

class OrderItem {
  OrderItem({
    this.id,
    this.item,
    this.count,
  });

  final String? id;
  final Product? item;
  final int? count;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["_id"],
        item: Product.fromJson(json["item"]),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "item": item!.toJson(),
        "count": count,
      };
}

class ShippingInfo {
  ShippingInfo({
    this.address,
    this.phoneNo,
  });

  final String? address;
  final String? phoneNo;

  factory ShippingInfo.fromJson(Map<String, dynamic> json) => ShippingInfo(
        address: json["address"],
        phoneNo: json["phoneNo"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "phoneNo": phoneNo,
      };
}
