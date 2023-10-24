import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_modify_request_dto.g.dart';

@JsonSerializable()
class UserModifyRequestDto extends Equatable {
  const UserModifyRequestDto({
    required this.userDisplayName,
    this.userPhone = '',
    this.imageProfileName = '',
  });

  final String userDisplayName;
  final String userPhone;
  final String imageProfileName;

  @override
  List<Object?> get props => [
    userDisplayName,
    userPhone,
    imageProfileName,
  ];

  factory UserModifyRequestDto.fromJson(Map<String, dynamic> json) => _$UserModifyRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserModifyRequestDtoToJson(this);
}
