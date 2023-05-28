part of 'root_page_bloc.dart';

abstract class RootPageState extends Equatable {
  const RootPageState();

  @override
  List<Object> get props => [];
}

class RootPageInitial extends RootPageState {}

class RootPageStateMoveToSignInPage extends RootPageState {}

class RootPageStateAuthCheckSuccess extends RootPageState {}
