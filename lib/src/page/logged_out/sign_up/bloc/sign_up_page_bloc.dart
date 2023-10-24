import 'dart:async';

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
    try {
      emit(SignUpStateInProgress());

      final isEmailAvailable =
          await _authenticationRepository.checkEmailDuplication(
        event.email,
      );

      emit(SignUpStateDuplicateCheckSuccess(useEmailAvailable: isEmailAvailable));
    } catch (error) {
      print('hajin ${error.toString()}');
    }
  }

  Future<void> _onCompleteButtonPressed(
    SignUpEventCompleteButtonPressed event,
    Emitter<SignUpPageState> emit,
  ) async {
    try {
      emit(SignUpStateInProgress());

      if (event.name.isEmpty) {
        emit(SignUpStateShowErrorSnackBar(message: '이름을 입력해주세요!'));
        return;
      }

      if (event.email.isEmpty) {
        emit(SignUpStateShowErrorSnackBar(message: '이메일을 입력해주세요!'));
        return;
      }

      if (!event.isDuplicateChecked) {
        emit(SignUpStateShowErrorSnackBar(message: '이메일 중복체크를 해주세요!'));
        return;
      }

      if (event.password != event.passwordConfirm) {
        emit(SignUpStateShowErrorSnackBar(message: '비밀번호가 일치하지 않습니다!'));
        return;
      }

      await _authenticationRepository.signUp(
        name: event.name,
        password: event.password,
        email: event.email,
      );

      emit(SignUpStateShowSuccessSnackBar(message: '회원가입에 성공하였습니다!'));
      emit(SignUpStatePop());
    } catch (error) {}
  }
}
