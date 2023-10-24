import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  UserDto? get currentUser;

  Future<void> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<void> loginWithGoogle();

  Future<bool> isUseGoogleLogin(String email);

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<bool> checkEmailDuplication(String email);
}
