// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StatusModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusModel _$StatusModelFromJson(Map<String, dynamic> json) {
  return StatusModel(
    status: json['status'] as bool?,
    tracerStatus: json['tracerStatus'] as int?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$StatusModelToJson(StatusModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'tracerStatus': instance.tracerStatus,
      'message': instance.message,
    };
