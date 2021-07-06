import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        required this.isverified,
        required this.blocked,
        required this.phone,
        required this.photoUrl,
        required this.numOfCoins,
        required this.id,
        required this.address,
        required this.name,
        required this.email,
        required this.cart,
        required this.createdAt,
        required this.updatedAt,
    });

    bool isverified;
    bool blocked;
    String phone;
    String photoUrl;
    int numOfCoins;
    String id;
    String address;
    String name;
    String email;
    List<dynamic> cart;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        isverified: json["isverified"],
        blocked: json["blocked"],
        phone: json["phone"] == null ? "":json["phone"],
        address: json["address"] == null ? "":json["address"],
        photoUrl: json["photoUrl"],
        numOfCoins: json["numOfCoins"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        cart: List<dynamic>.from(json["cart"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "isverified": isverified,
        "blocked": blocked,
        "phone": phone,
        "address": address,
        "photoUrl": photoUrl,
        "numOfCoins": numOfCoins,
        "_id": id,
        "name": name,
        "email": email,
        "cart": List<dynamic>.from(cart.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
