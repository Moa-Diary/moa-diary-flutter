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
      final email = event.email;
      final password = event.password;

      if (email.isEmpty) {
        emit(const SignInStateShowSnackBar(message: '아이디를 입력해주세요!'));
        return;
      }

      if (password.isEmpty) {
        emit(const SignInStateShowSnackBar(message: '비밀번호를 입력해주세요!'));
        return;
      }

      await _authenticationRepository.login(
        email: event.email.trim(),
        password: event.password.trim(),
      );

      emit(SignInStateSignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        emit(const SignInStateShowSnackBar(message: '유효한 이메일이 아닙니다!'));
      } else if (e.code == 'user-disable') {
        emit(const SignInStateShowSnackBar(message: '비활성화된 계정입니다!'));
      } else if (e.code == 'user-not-found') {
        emit(const SignInStateShowSnackBar(message: '이메일과 일치하는 계정을 찾을 수 없습니다!'));
      } else if (e.code == 'wrong-password') {
        emit(const SignInStateShowSnackBar(message: '비밀번호가 일치하지 않습니다!'));
      } else {
        emit(SignInStateShowSnackBar(message: '로그인 중 오류가 발생했습니다! ${e.code}'));
      }
    } catch (e) {
      emit(const SignInStateShowSnackBar(message: '오류가 발생했습니다!'));
    }
  }
}
