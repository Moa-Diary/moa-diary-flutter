import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';

abstract class AuthenticationProvider {
  Future<void> signUp(SignUpRequestDto dto);

  Future<UserDto> fetchUser(String email);

  Future<void> modifyUser({
    required String email,
    required UserModifyRequestDto dto,
  });

  Future<void> deleteUser(String email);

  Future<bool> checkEmailDuplication(String email);
}
