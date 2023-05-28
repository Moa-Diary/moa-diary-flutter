import 'package:firebase_auth/firebase_auth.dart';
import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';

class AuthenticationDataRepository extends AuthenticationRepository {
  AuthenticationDataRepository() : super() {
    _initializeFirebaseAuth();
  }

  User? _currentUser;

  @override
  User? get currentUser => _currentUser;

  void _initializeFirebaseAuth() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _currentUser = user;
    });
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
