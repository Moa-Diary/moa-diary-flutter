part of 'sign_in_page_bloc.dart';

abstract class SignInPageState extends Equatable {
  const SignInPageState();

  @override
  List<Object> get props => [];
}

class SignInPageInitial extends SignInPageState {}

class SignInStateSignInSuccess extends SignInPageState {}

class SignInStateShowSnackBar extends SignInPageState {
  const SignInStateShowSnackBar({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
