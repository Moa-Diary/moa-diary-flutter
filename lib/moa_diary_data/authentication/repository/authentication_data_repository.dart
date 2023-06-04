import 'package:firebase_auth/firebase_auth.dart';
import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';

class AuthenticationDataRepository extends AuthenticationRepository {
  AuthenticationDataRepository({
    required FirebaseAuth firebaseAuthProvider,
    required AuthenticationProvider authenticationProvider,
  })  : _firebaseAuthProvider = firebaseAuthProvider,
        _authenticationProvider = authenticationProvider,
        super() {
    _initializeFirebaseAuth();
  }

  final FirebaseAuth _firebaseAuthProvider;
  final AuthenticationProvider _authenticationProvider;
  User? _currentUser;

  @override
  User? get currentUser => _currentUser;

  void _initializeFirebaseAuth() {
    _firebaseAuthProvider.authStateChanges().listen((User? user) {
      _currentUser = user;
    });
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await _firebaseAuthProvider.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    await _firebaseAuthProvider.signOut();
  }

  @override
  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final user = await _firebaseAuthProvider.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user.user?.uid ?? '';
  }

  @override
  Future<void> registerUser(UserRegisterDto dto) async {
    await _authenticationProvider.registerUser(dto);
  }

  @override
  Future<bool> checkEmailDuplicate(String email) async{
    return await _authenticationProvider.checkEmailDuplicate(email);
  }
}
