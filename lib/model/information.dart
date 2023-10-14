// To parse this JSON data, do
//
//     final infomation = infomationFromJson(jsonString);

import 'dart:convert';

List<Infomation> infomationFromJson(String str) =>
    List<Infomation>.from(json.decode(str).map((x) => Infomation.fromJson(x)));

String infomationToJson(List<Infomation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Infomation {
  String gender;
  Name name;
  String email;
  Dob dob;
  String phone;
  Picture picture;

  Infomation({
    required this.gender,
    required this.name,
    required this.email,
    required this.dob,
    required this.phone,
    required this.picture,
  });

  factory Infomation.fromJson(Map<String, dynamic> json) => Infomation(
        gender: json["gender"],
        name: Name.fromJson(json["name"]),
        email: json["email"],
        dob: Dob.fromJson(json["dob"]),
        phone: json["phone"],
        picture: Picture.fromJson(json["picture"]),
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name.toJson(),
        "email": email,
        "dob": dob.toJson(),
        "phone": phone,
        "picture": picture.toJson(),
      };
}

class Dob {
  DateTime date;
  int age;

  Dob({
    required this.date,
    required this.age,
  });

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        date: DateTime.parse(json["date"]),
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "age": age,
      };
}

class Name {
  String title;
  String first;
  String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}

class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
