import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_register_dto.g.dart';

@JsonSerializable()
class UserRegisterDto extends Equatable {
  const UserRegisterDto({
    this.userName = '',
    this.userEmail = '',
    this.userPhone = '',
    this.firebaseUniqueKey = '',
  });

  final String userName;
  final String userEmail;
  final String userPhone;
  final String firebaseUniqueKey;

  @override
  List<Object> get props => [
    userName,
    userEmail,
    userPhone,
    firebaseUniqueKey,
  ];

  factory UserRegisterDto.fromJson(Map<String, dynamic> json) => _$UserRegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterDtoToJson(this);
}