// To parse this JSON data, do
//
//     final statsModel = statsModelFromJson(jsonString);
import 'package:json_annotation/json_annotation.dart';
part 'StatsModel.g.dart';

@JsonSerializable(explicitToJson: true)
class StatsModel {
  StatsModel({
    this.infected,
    this.tested,
    this.recovered,
    this.deceased,
    this.activeCases,
    this.unique,
    this.country,
    this.historyData,
    this.sourceUrl,
    this.lastUpdatedAtApify,
    this.readMe,
  });

  int? infected;
  int? tested;
  int? recovered;
  int? deceased;
  int? activeCases;
  int? unique;
  String? country;
  String? historyData;
  String? sourceUrl;
  DateTime? lastUpdatedAtApify;
  String? readMe;

  factory StatsModel.fromJson(Map<String, dynamic> json) => StatsModel(
        infected: json["infected"],
        tested: json["tested"],
        recovered: json["recovered"],
        deceased: json["deceased"],
        activeCases: json["activeCases"],
        unique: json["unique"],
        country: json["country"],
        historyData: json["historyData"],
        sourceUrl: json["sourceUrl"],
        lastUpdatedAtApify: DateTime.parse(json["lastUpdatedAtApify"]),
        readMe: json["readMe"],
      );

  Map<String, dynamic> toJson() => {
        "infected": infected,
        "tested": tested,
        "recovered": recovered,
        "deceased": deceased,
        "activeCases": activeCases,
        "unique": unique,
        "country": country,
        "historyData": historyData,
        "sourceUrl": sourceUrl,
        "lastUpdatedAtApify": lastUpdatedAtApify!.toIso8601String(),
        "readMe": readMe,
      };
}
