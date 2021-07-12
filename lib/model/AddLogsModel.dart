import 'package:json_annotation/json_annotation.dart';

part 'AddLogsModel.g.dart';

@JsonSerializable(explicitToJson: true)
class AddLogsModel {
  AddLogsModel({
    this.message,
    this.errors,
    this.status,
  });

  String? message;
  Errors? errors;
  bool? status;

  factory AddLogsModel.fromJson(Map<String, dynamic> json) => AddLogsModel(
        message: json["message"],
        errors: json['errors'] == null ? null : Errors.fromJson(json["errors"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors!.toJson(),
        "status": status,
      };
}

class Errors {
  Errors({
    this.guid,
  });

  List<String>? guid;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        guid: List<String>.from(json["guid"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "guid": List<dynamic>.from(guid!.map((x) => x)),
      };
}
