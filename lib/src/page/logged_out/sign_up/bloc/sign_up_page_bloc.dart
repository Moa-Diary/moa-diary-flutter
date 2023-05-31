import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_page_event.dart';
part 'sign_up_page_state.dart';

class SignUpPageBloc extends Bloc<SignUpPageEvent, SignUpPageState> {
  SignUpPageBloc() : super(SignUpPageInitial()) {
    on<SignUpPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
