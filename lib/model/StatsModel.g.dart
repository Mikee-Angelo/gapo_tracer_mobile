// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StatsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatsModel _$StatsModelFromJson(Map<String, dynamic> json) {
  return StatsModel(
    infected: json['infected'] as int?,
    tested: json['tested'] as int?,
    recovered: json['recovered'] as int?,
    deceased: json['deceased'] as int?,
    activeCases: json['activeCases'] as int?,
    unique: json['unique'] as int?,
    country: json['country'] as String?,
    historyData: json['historyData'] as String?,
    sourceUrl: json['sourceUrl'] as String?,
    lastUpdatedAtApify: json['lastUpdatedAtApify'] == null
        ? null
        : DateTime.parse(json['lastUpdatedAtApify'] as String),
    readMe: json['readMe'] as String?,
  );
}

Map<String, dynamic> _$StatsModelToJson(StatsModel instance) =>
    <String, dynamic>{
      'infected': instance.infected,
      'tested': instance.tested,
      'recovered': instance.recovered,
      'deceased': instance.deceased,
      'activeCases': instance.activeCases,
      'unique': instance.unique,
      'country': instance.country,
      'historyData': instance.historyData,
      'sourceUrl': instance.sourceUrl,
      'lastUpdatedAtApify': instance.lastUpdatedAtApify?.toIso8601String(),
      'readMe': instance.readMe,
    };
