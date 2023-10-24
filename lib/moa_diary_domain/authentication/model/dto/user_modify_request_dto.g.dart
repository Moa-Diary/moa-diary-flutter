// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_modify_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModifyRequestDto _$UserModifyRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UserModifyRequestDto(
      userDisplayName: json['userDisplayName'] as String,
      userPhone: json['userPhone'] as String? ?? '',
      imageProfileName: json['imageProfileName'] as String? ?? '',
    );

Map<String, dynamic> _$UserModifyRequestDtoToJson(
        UserModifyRequestDto instance) =>
    <String, dynamic>{
      'userDisplayName': instance.userDisplayName,
      'userPhone': instance.userPhone,
      'imageProfileName': instance.imageProfileName,
    };
