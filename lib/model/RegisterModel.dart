import 'package:json_annotation/json_annotation.dart';

part 'RegisterModel.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterModel {
  RegisterModel({
    this.status,
    this.user,
    this.accessToken,
  });

  bool? status;
  User? user;
  String? accessToken;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json["status"],
        user: json['user'] == null ? null : User.fromJson(json["user"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user!.toJson(),
        "access_token": accessToken,
      };
}

class User {
  User({
    this.firstName,
    this.lastName,
    this.phone,
    this.age,
    this.gender,
    this.address,
    this.fullName,
    this.guid,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? firstName;
  String? lastName;
  String? phone;
  int? age;
  String? gender;
  String? address;
  String? fullName;
  String? guid;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        age: json["age"],
        gender: json["gender"],
        address: json["address"],
        fullName: json["full_name"],
        guid: json["guid"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "age": age,
        "gender": gender,
        "address": address,
        "full_name": fullName,
        "guid": guid,
        "updated_at": updatedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "id": id,
      };
}
