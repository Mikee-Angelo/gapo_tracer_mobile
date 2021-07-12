// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) {
  return RegisterModel(
    status: json['status'] as bool?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    accessToken: json['accessToken'] as String?,
  );
}

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user': instance.user?.toJson(),
      'accessToken': instance.accessToken,
    };
