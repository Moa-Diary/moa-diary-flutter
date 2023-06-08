import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';

part 'sign_up_page_event.dart';

part 'sign_up_page_state.dart';

class SignUpPageBloc extends Bloc<SignUpPageEvent, SignUpPageState> {
  SignUpPageBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(SignUpPageInitial()) {
    on<SignUpEventStarted>(_onStarted);
    on<SignUpEventDuplicateCheckButtonPressed>(_onDuplicateCheckButtonPressed);
    on<SignUpEventCompleteButtonPressed>(_onCompleteButtonPressed);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onStarted(
    SignUpEventStarted event,
    Emitter<SignUpPageState> emit,
  ) async {
    emit(SignUpStateStartSuccess());
  }

  Future<void> _onDuplicateCheckButtonPressed(
    SignUpEventDuplicateCheckButtonPressed event,
    Emitter<SignUpPageState> emit,
  ) async {
    emit(SignUpStateInProgress());

    try {
      final isEmailAvailable =
          await _authenticationRepository.checkEmailDuplicate(
        event.email,
      );
      emit(SignUpStateDuplicateCheckSuccess(useEmailAvailable: isEmailAvailable));
    } catch (e) {
      emit(SignUpStateShowSnackBar(message: e.toString()));
    }
  }

  Future<void> _onCompleteButtonPressed(
    SignUpEventCompleteButtonPressed event,
    Emitter<SignUpPageState> emit,
  ) async {
    emit(SignUpStateInProgress());
    try {
      if (event.name.isEmpty) {
        emit(const SignUpStateShowSnackBar(message: '이름을 입력해주세요!'));
        return;
      }

      if (!event.isDuplicateChecked) {
        emit(const SignUpStateShowSnackBar(message: '이메일 중복확인을 진행해주세요!'));
        return;
      }

      if (!event.isEmailAvailable) {
        emit(const SignUpStateShowSnackBar(message: '사용 불가능한 이메일입니다!'));
        return;
      }

      if (event.password.isEmpty) {
        emit(const SignUpStateShowSnackBar(message: '비밀번호를 입력해주세요!'));
        return;
      }

      if (event.password != event.passwordConfirm) {
        emit(const SignUpStateShowSnackBar(message: '비밀번호가 일치하지 않습니다!'));
        return;
      }

      final uid = await _authenticationRepository.signUp(
        name: event.name,
        email: event.email,
        password: event.password,
      );

      final dto = UserRegisterDto(
        userName: event.name,
        userEmail: event.email,
        userPhone: '',
        firebaseUniqueKey: uid,
      );

      await _authenticationRepository.registerUser(dto);
      emit(SignUpStateSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(const SignUpStateShowSnackBar(message: '비밀번호가 너무 약합니다!'));
      } else if (e.code == 'email-already-in-use') {
        emit(const SignUpStateShowSnackBar(message: '이미 사용중인 이메일입니다!'));
      } else {
        emit(const SignUpStateShowSnackBar(message: '회원가입 도중 오류가 발생했습니다!'));
      }
    } catch (e) {
      emit(SignUpStateShowSnackBar(message: e.toString()));
    }
  }
}
