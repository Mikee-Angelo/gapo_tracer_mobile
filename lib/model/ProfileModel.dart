import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class ProfileModel {
  ProfileModel({
    this.id,
    this.email,
    this.phone,
    this.address,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.usersProfiles,
    this.qr,
  });

  int? id;
  String? email;
  String? phone;
  String? address;
  dynamic? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  UsersProfiles? usersProfiles;
  Qr? qr;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        usersProfiles: UsersProfiles.fromJson(json["users_profiles"]),
        qr: Qr.fromJson(json["qr"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone": phone,
        "address": address,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "users_profiles": usersProfiles!.toJson(),
        "qr": qr!.toJson(),
      };
}

class Qr {
  Qr({
    this.id,
    this.userId,
    this.type,
    this.guid,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  int? type;
  String? guid;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Qr.fromJson(Map<String, dynamic> json) => Qr(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        guid: json["guid"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type": type,
        "guid": guid,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class UsersProfiles {
  UsersProfiles({
    this.firstName,
    this.lastName,
    this.fullName,
    this.createdAt,
    this.updatedAt,
  });

  String? firstName;
  String? lastName;
  String? fullName;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UsersProfiles.fromJson(Map<String, dynamic> json) => UsersProfiles(
        firstName: json["first_name"],
        lastName: json["last_name"],
        fullName: json["full_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "full_name": fullName,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
