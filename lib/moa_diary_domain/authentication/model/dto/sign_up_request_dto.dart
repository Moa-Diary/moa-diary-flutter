import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_dto.g.dart';

@JsonSerializable()
class SignUpRequestDto extends Equatable {
  const SignUpRequestDto({
    required this.userName,
    required this.userEmail,
    required this.firebaseUniqueKey,
  });

  final String userName;
  final String userEmail;
  final String firebaseUniqueKey;

  @override
  List<Object?> get props => [
    userName,
    userEmail,
    firebaseUniqueKey,
  ];

  factory SignUpRequestDto.fromJson(Map<String, dynamic> json) => _$SignUpRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestDtoToJson(this);
}
