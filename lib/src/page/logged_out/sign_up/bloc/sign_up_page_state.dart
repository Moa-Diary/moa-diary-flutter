part of 'sign_up_page_bloc.dart';

abstract class SignUpPageState extends Equatable {
  const SignUpPageState();

  @override
  List<Object> get props => [];
}

class SignUpPageInitial extends SignUpPageState {}

class SignUpStateStartSuccess extends SignUpPageState {}

class SignUpStateDuplicateCheckSuccess extends SignUpPageState {
  const SignUpStateDuplicateCheckSuccess({required this.useEmailAvailable});

  final bool useEmailAvailable;

  @override
  List<Object> get props => [useEmailAvailable];
}

class SignUpStateInProgress extends SignUpPageState {}

class SignUpStateShowErrorSnackBar extends SignUpPageState {
  const SignUpStateShowErrorSnackBar({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

class SignUpStateShowSuccessSnackBar extends SignUpPageState {
  const SignUpStateShowSuccessSnackBar({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

class SignUpStatePop extends SignUpPageState {}
