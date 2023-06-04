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
