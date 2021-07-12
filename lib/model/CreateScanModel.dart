import 'package:json_annotation/json_annotation.dart';

part 'CreateScanModel.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateScanModel {
  CreateScanModel({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory CreateScanModel.fromJson(Map<String, dynamic> json) =>
      CreateScanModel(
        success: json["success"],
        data: json['data'] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data!.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
