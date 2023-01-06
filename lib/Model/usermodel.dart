// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    UserModel({
        required this.createdAt,
        required this.name,
        required this.image,
        required this.id,
    });

    int createdAt;
    String name;
    String image;
    String id;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        createdAt: json["createdAt"],
        name: json["name"],
        image: json["image"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "name": name,
        "image": image,
        "id": id,
    };
}
