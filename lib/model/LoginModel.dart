import 'package:json_annotation/json_annotation.dart';

part 'LoginModel.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginModel {
  LoginModel({
    this.user,
    this.accessToken,
  });

  User? user;
  String? accessToken;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: json['user'] == null ? null : User.fromJson(json["user"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
        "access_token": accessToken,
      };
}

class User {
  User({
    this.id,
    this.guid,
    this.firstName,
    this.lastName,
    this.fullName,
    this.phone,
    this.age,
    this.gender,
    this.address,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? guid;
  String? firstName;
  String? lastName;
  String? fullName;
  String? phone;
  int? age;
  String? gender;
  String? address;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? deletedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        guid: json["guid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        fullName: json["full_name"],
        phone: json["phone"],
        age: json["age"],
        gender: json["gender"],
        address: json["address"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guid": guid,
        "first_name": firstName,
        "last_name": lastName,
        "full_name": fullName,
        "phone": phone,
        "age": age,
        "gender": gender,
        "address": address,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
