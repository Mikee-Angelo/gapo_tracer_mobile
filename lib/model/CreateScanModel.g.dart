// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreateScanModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateScanModel _$CreateScanModelFromJson(Map<String, dynamic> json) {
  return CreateScanModel(
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$CreateScanModelToJson(CreateScanModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data?.toJson(),
      'message': instance.message,
    };
