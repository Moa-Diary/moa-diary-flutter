import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';

abstract class AuthenticationProvider {
  Future<void> registerUser(UserRegisterDto dto);

  Future<bool> checkEmailDuplicate(String email);
}
