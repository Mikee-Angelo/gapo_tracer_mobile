// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OloStatsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OloStatsModel _$OloStatsModelFromJson(Map<String, dynamic> json) {
  return OloStatsModel(
    status: json['status'] as bool?,
    suspected: json['suspected'] as int?,
    negative: json['negative'] as int?,
    active: json['active'] as int?,
    confirmed: json['confirmed'] as int?,
    recovered: json['recovered'] as int?,
    death: json['death'] as int?,
  );
}

Map<String, dynamic> _$OloStatsModelToJson(OloStatsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'suspected': instance.suspected,
      'negative': instance.negative,
      'active': instance.active,
      'confirmed': instance.confirmed,
      'recovered': instance.recovered,
      'death': instance.death,
    };
