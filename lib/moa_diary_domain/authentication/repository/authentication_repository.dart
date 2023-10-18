import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  User? get currentUser;

  Future<void> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<void> loginWithGoogle();

  Future<bool> useGoogleLogin(String email);
}
