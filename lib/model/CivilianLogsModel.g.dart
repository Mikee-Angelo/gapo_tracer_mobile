// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CivilianLogsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CivilianLogsModel _$CivilianLogsModelFromJson(Map<String, dynamic> json) {
  return CivilianLogsModel(
    success: json['success'] as bool?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
        .toList(),
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$CivilianLogsModelToJson(CivilianLogsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'message': instance.message,
    };
