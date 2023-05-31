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
    emit(SignUpStateInProgress());
    emit(const SignUpStateDuplicateCheckSuccess(useEmailAvailable: true));
  }

  Future<void> _onCompleteButtonPressed(
    SignUpEventCompleteButtonPressed event,
    Emitter<SignUpPageState> emit,
  ) async {}
}
