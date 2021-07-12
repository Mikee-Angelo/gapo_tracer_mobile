// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddLogsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddLogsModel _$AddLogsModelFromJson(Map<String, dynamic> json) {
  return AddLogsModel(
    message: json['message'] as String?,
    errors: json['errors'] == null
        ? null
        : Errors.fromJson(json['errors'] as Map<String, dynamic>),
    status: json['status'] as bool?,
  );
}

Map<String, dynamic> _$AddLogsModelToJson(AddLogsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errors': instance.errors?.toJson(),
      'status': instance.status,
    };
