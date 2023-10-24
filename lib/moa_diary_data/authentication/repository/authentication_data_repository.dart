import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  UserDto? _currentUser;

  @override
  UserDto? get currentUser => _currentUser;

  void _initializeFirebaseAuth() {
    _firebaseAuthProvider.authStateChanges().listen((
      User? user,
    ) async {
      _currentUser = await _authenticationProvider.fetchUser(user?.email ?? '');
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
  Future<void> loginWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();

    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await _firebaseAuthProvider.signInWithCredential(credential);
  }

  @override
  Future<bool> isUseGoogleLogin(String email) async {
    List<String> providerList =
        await _firebaseAuthProvider.fetchSignInMethodsForEmail(email);

    return providerList.contains(GoogleAuthProvider.GOOGLE_SIGN_IN_METHOD);
  }

  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _firebaseAuthProvider.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await _authenticationProvider.signUp(SignUpRequestDto(
      userName: name,
      userEmail: email,
      firebaseUniqueKey: response.user?.uid ?? '',
    ));
  }

  @override
  Future<bool> checkEmailDuplication(String email) async {
    return await _authenticationProvider.checkEmailDuplication(email);
  }
}
