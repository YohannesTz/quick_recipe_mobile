import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String name;
  String email;
  String password;
  String displayName;
  String photoUrl;
  String themeColor;
  String themeName;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.displayName,
    required this.photoUrl,
    required this.themeColor,
    required this.themeName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    displayName: json["displayName"],
    photoUrl: json["photoUrl"],
    themeColor: json["themeColor"],
    themeName: json["themeName"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "displayName": displayName,
    "photoUrl": photoUrl,
    "themeColor": themeColor,
    "themeName": themeName,
  };
}
