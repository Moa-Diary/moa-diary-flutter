// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegisterDto _$UserRegisterDtoFromJson(Map<String, dynamic> json) =>
    UserRegisterDto(
      userName: json['userName'] as String? ?? '',
      userEmail: json['userEmail'] as String? ?? '',
      userPhone: json['userPhone'] as String? ?? '',
      firebaseUniqueKey: json['firebaseUniqueKey'] as String? ?? '',
    );

Map<String, dynamic> _$UserRegisterDtoToJson(UserRegisterDto instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'userPhone': instance.userPhone,
      'firebaseUniqueKey': instance.firebaseUniqueKey,
    };
