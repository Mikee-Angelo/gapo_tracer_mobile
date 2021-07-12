class VehicleLogsModel {
  VehicleLogsModel({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<Datum>? data;
  String? message;

  factory VehicleLogsModel.fromJson(Map<String, dynamic> json) =>
      VehicleLogsModel(
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
  Host? host;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        host: Host.fromJson(json["host"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "host": host!.toJson(),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class Host {
  Host({
    this.bodyNo,
    this.type,
  });

  String? bodyNo;
  String? type;

  factory Host.fromJson(Map<String, dynamic> json) => Host(
        bodyNo: json["body_no"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "body_no": bodyNo,
        "type": type,
      };
}
