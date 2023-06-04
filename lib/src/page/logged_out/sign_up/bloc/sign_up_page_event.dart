part of 'sign_up_page_bloc.dart';

abstract class SignUpPageEvent extends Equatable {
  const SignUpPageEvent();

  @override
  List<Object> get props => [];
}

class SignUpEventStarted extends SignUpPageEvent {}

class SignUpEventDuplicateCheckButtonPressed extends SignUpPageEvent {
  const SignUpEventDuplicateCheckButtonPressed({
    required this.email,
  });

  final String email;

  @override
  List<Object> get props => [email];
}

class SignUpEventCompleteButtonPressed extends SignUpPageEvent {
  const SignUpEventCompleteButtonPressed({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.isDuplicateChecked,
  });

  final String name;
  final String email;
  final String password;
  final String passwordConfirm;
  final bool isDuplicateChecked;

  @override
  List<Object> get props => [
        name,
        email,
        password,
        passwordConfirm,
        isDuplicateChecked,
      ];
}