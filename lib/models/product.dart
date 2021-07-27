// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);
import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
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

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        // price: double.parse(json["price"].toString()),
        // ratings: double.parse(json["ratings"].toString()),
        price: int.parse(json["price"].toString()),
        ratings: int.parse(json["ratings"].toString()),
        numOfReviews: json["numOfReviews"],
        stock: json["stock"],
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        imageurl: json["imageurl"],
        category: json["category"],
        reviews: json ["reviews"] == null ? [] : List<dynamic>.from(json["reviews"].map((x) => x)),
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
