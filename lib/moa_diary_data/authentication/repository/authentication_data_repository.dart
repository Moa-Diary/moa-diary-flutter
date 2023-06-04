import 'package:firebase_auth/firebase_auth.dart';
import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';

class AuthenticationDataRepository extends AuthenticationRepository {
  AuthenticationDataRepository({required FirebaseAuth authProvider})
      : _authProvider = authProvider,
        super() {
    _initializeFirebaseAuth();
  }

  final FirebaseAuth _authProvider;
  User? _currentUser;

  @override
  User? get currentUser => _currentUser;

  void _initializeFirebaseAuth() {
    _authProvider.authStateChanges().listen((User? user) {
      _currentUser = user;
    });
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await _authProvider.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    await _authProvider.signOut();
  }
}
