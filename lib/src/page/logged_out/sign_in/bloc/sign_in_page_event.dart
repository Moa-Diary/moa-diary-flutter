part of 'sign_in_page_bloc.dart';

abstract class SignInPageEvent extends Equatable {
  const SignInPageEvent();

  @override
  List<Object> get props => [];
}

class SignInEventStarted extends SignInPageEvent {}

class SignInEventSignInRequested extends SignInPageEvent {
  const SignInEventSignInRequested({required this.email, required this.password,});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class SignInEventGoogleSignInRequested extends SignInPageEvent {}
