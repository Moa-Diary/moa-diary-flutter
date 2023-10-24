import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto extends Equatable {
  const UserDto({
    this.userId = -1,
    this.userName = '',
    this.userDisplayName = '',
    this.userEmail = '',
    this.userPhone = '',
    this.imageProfileName = '',
  });

  final int userId;
  final String userName;
  final String userDisplayName;
  final String userEmail;
  final String userPhone;
  final String imageProfileName;

  @override
  List<Object?> get props => [
    userId,
    userName,
    userDisplayName,
    userEmail,
    userPhone,
    imageProfileName,
  ];

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
