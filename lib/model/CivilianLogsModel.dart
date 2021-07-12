import 'package:json_annotation/json_annotation.dart';
part 'CivilianLogsModel.g.dart';

@JsonSerializable(explicitToJson: true)
class CivilianLogsModel {
  CivilianLogsModel({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<Datum>? data;
  String? message;

  factory CivilianLogsModel.fromJson(Map<String, dynamic> json) =>
      CivilianLogsModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.id,
    this.host,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? host;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        host: json["host"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "host": host,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
