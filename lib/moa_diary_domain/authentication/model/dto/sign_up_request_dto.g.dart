// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestDto _$SignUpRequestDtoFromJson(Map<String, dynamic> json) =>
    SignUpRequestDto(
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
      firebaseUniqueKey: json['firebaseUniqueKey'] as String,
    );

Map<String, dynamic> _$SignUpRequestDtoToJson(SignUpRequestDto instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'firebaseUniqueKey': instance.firebaseUniqueKey,
    };
