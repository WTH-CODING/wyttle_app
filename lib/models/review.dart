// To parse this JSON data, do
//
//     final review = reviewFromJson(jsonString);
import 'dart:convert';

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

String reviewToJson(Review data) => json.encode(data.toJson());

class Review {
    Review({
        required this.thumbsUpCount,
        required this.thumbsDownCount,
        required this.id,
        required this.user,
        required this.title,
        required this.description,
        required this.rating,
        required this.product,
        required this.v,
    });

    final int thumbsUpCount;
    final int thumbsDownCount;
    final String id;
    final String user;
    final String title;
    final String description;
    final double rating;
    final String product;
    final int v;

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        thumbsUpCount: json["thumbsUpCount"],
        thumbsDownCount: json["thumbsDownCount"],
        id: json["_id"],
        user: json["user"],
        title: json["title"],
        description: json["description"],
        rating: json["rating"].toDouble(),
        product: json["product"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "thumbsUpCount": thumbsUpCount,
        "thumbsDownCount": thumbsDownCount,
        "_id": id,
        "user": user,
        "title": title,
        "description": description,
        "rating": rating,
        "product": product,
        "__v": v,
    };
}
