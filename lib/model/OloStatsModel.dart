import 'package:json_annotation/json_annotation.dart';
part 'OloStatsModel.g.dart';

@JsonSerializable(explicitToJson: true)
class OloStatsModel {
  OloStatsModel({
    this.status,
    this.suspected,
    this.negative,
    this.active,
    this.confirmed,
    this.recovered,
    this.death,
  });

  bool? status;
  int? suspected;
  int? negative;
  int? active;
  int? confirmed;
  int? recovered;
  int? death;

  factory OloStatsModel.fromJson(Map<String, dynamic> json) => OloStatsModel(
        status: json["status"],
        suspected: json["suspected"],
        negative: json["negative"],
        active: json["active"],
        confirmed: json["confirmed"],
        recovered: json["recovered"],
        death: json["death"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "suspected": suspected,
        "negative": negative,
        "active": active,
        "confirmed": confirmed,
        "recovered": recovered,
        "death": death,
      };
}
