import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';

part 'root_page_event.dart';

part 'root_page_state.dart';

class RootPageBloc extends Bloc<RootPageEvent, RootPageState> {
  RootPageBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(RootPageInitial()) {
    on<RootPageEventStarted>(_onStarted);
    on<RootPageEventAuthCheckRequested>(_onAuthCheckRequested);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onStarted(
    RootPageEventStarted event,
    Emitter<RootPageState> emit,
  ) async {
    // TODO : 로그인/회원가입 기능 구현 후 삭제 요망
    _authenticationRepository.logout();
    emit(RootPageStateStartSuccess());
    add(RootPageEventAuthCheckRequested());
  }

  Future<void> _onAuthCheckRequested(
    RootPageEventAuthCheckRequested event,
    Emitter<RootPageState> emit,
  ) async {
    if (_authenticationRepository.currentUser == null) {
      emit(RootPageStateMoveToSignInPage());
      return;
    }

    emit(RootPageStateAuthCheckSuccess());
  }
}
