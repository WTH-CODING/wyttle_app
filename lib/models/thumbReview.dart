// To parse this JSON data, do
//
//     final thumbReview = thumbReviewFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ThumbReview> thumbReviewFromJson(String str) => List<ThumbReview>.from(json.decode(str).map((x) => ThumbReview.fromJson(x)));

String thumbReviewToJson(List<ThumbReview> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ThumbReview {
    ThumbReview({
        required this.id,
        required this.user,
        required this.vouteUp,
        required this.review,
        required this.v,
    });

    final String id;
    final String user;
    final bool vouteUp;
    final String review;
    final int v;

    factory ThumbReview.fromJson(Map<String, dynamic> json) => ThumbReview(
        id: json["_id"],
        user: json["user"],
        vouteUp: json["vouteUp"],
        review: json["review"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "vouteUp": vouteUp,
        "review": review,
        "__v": v,
    };
}
