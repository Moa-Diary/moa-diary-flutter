// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      userId: json['userId'] as int? ?? -1,
      userName: json['userName'] as String? ?? '',
      userDisplayName: json['userDisplayName'] as String? ?? '',
      userEmail: json['userEmail'] as String? ?? '',
      userPhone: json['userPhone'] as String? ?? '',
      imageProfileName: json['imageProfileName'] as String? ?? '',
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'userDisplayName': instance.userDisplayName,
      'userEmail': instance.userEmail,
      'userPhone': instance.userPhone,
      'imageProfileName': instance.imageProfileName,
    };
