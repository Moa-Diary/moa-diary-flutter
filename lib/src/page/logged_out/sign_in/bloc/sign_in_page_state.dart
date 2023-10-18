part of 'sign_in_page_bloc.dart';

abstract class SignInPageState extends Equatable {
  const SignInPageState();

  @override
  List<Object> get props => [];
}

class SignInPageInitial extends SignInPageState {}

class SignInStateSignInSuccess extends SignInPageState {}

class SignInStateShowErrorSnackBar extends SignInPageState {
  const SignInStateShowErrorSnackBar({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class SignInStateShowSuccessSnackBar extends SignInPageState {
  const SignInStateShowSuccessSnackBar({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class SignInStateInProgress extends SignInPageState {}
