import 'package:json_annotation/json_annotation.dart';
part 'StatusModel.g.dart'; 


@JsonSerializable(explicitToJson: true)
class StatusModel {
  StatusModel({
    this.status,
    this.tracerStatus,
    this.message,
  });

  bool? status;
  int? tracerStatus;
  String? message;

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        status: json["status"],
        tracerStatus: json["tracer_status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "tracer_status": tracerStatus,
        "message": message,
      };
}
