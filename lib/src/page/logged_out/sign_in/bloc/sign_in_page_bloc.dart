import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moa_diary_app/moa_diary_domain/authentication/authentication.dart';

part 'sign_in_page_event.dart';

part 'sign_in_page_state.dart';

class SignInPageBloc extends Bloc<SignInPageEvent, SignInPageState> {
  SignInPageBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(SignInPageInitial()) {
    on<SignInEventStarted>(_onStarted);
    on<SignInEventSignInRequested>(_onSignInRequested);
    on<SignInEventGoogleSignInRequested>(_onGoogleSignInRequested);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onStarted(
    SignInEventStarted event,
    Emitter<SignInPageState> emit,
  ) async {}

  Future<void> _onSignInRequested(
    SignInEventSignInRequested event,
    Emitter<SignInPageState> emit,
  ) async {
    try {
      emit(SignInStateInProgress());

      final email = event.email;
      final password = event.password;

      if (email.isEmpty) {
        emit(const SignInStateShowErrorSnackBar(message: '아이디를 입력해주세요!'));
        return;
      }

      if (password.isEmpty) {
        emit(const SignInStateShowErrorSnackBar(message: '비밀번호를 입력해주세요!'));
        return;
      }

      if (await _authenticationRepository.isUseGoogleLogin(email)) {
        emit(const SignInStateShowErrorSnackBar(
            message: '구글 계정이 존재합니다. 구글 로그인을 이용하세요.'));
        return;
      }

      await _authenticationRepository.login(
        email: event.email.trim(),
        password: event.password.trim(),
      );

      emit(const SignInStateShowSuccessSnackBar(
        message: '로그인되었습니다.',
      ));
      emit(SignInStateSignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        emit(const SignInStateShowErrorSnackBar(message: '유효한 이메일이 아닙니다!'));
      } else if (e.code == 'user-disable') {
        emit(const SignInStateShowErrorSnackBar(message: '비활성화된 계정입니다!'));
      } else if (e.code == 'user-not-found') {
        emit(
            const SignInStateShowErrorSnackBar(message: '이메일과 일치하는 계정을 찾을 수 없습니다!'));
      } else if (e.code == 'wrong-password') {
        emit(const SignInStateShowErrorSnackBar(message: '비밀번호가 일치하지 않습니다!'));
      } else {
        emit(SignInStateShowErrorSnackBar(message: '로그인 중 오류가 발생했습니다! ${e.code}'));
      }
    } catch (e) {
      emit(const SignInStateShowErrorSnackBar(message: '오류가 발생했습니다!'));
    }
  }

  Future<void> _onGoogleSignInRequested(
    SignInEventGoogleSignInRequested event,
    Emitter<SignInPageState> emit,
  ) async {
    try {
      emit(SignInStateInProgress());

      await _authenticationRepository.loginWithGoogle();

      emit(SignInStateSignInSuccess());
    } catch (e) {
      emit(SignInStateShowErrorSnackBar(message: '오류가 발생했습니다! ${e.toString()}'));
    }
  }
}
