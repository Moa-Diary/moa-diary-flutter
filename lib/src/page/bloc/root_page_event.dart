part of 'root_page_bloc.dart';

abstract class RootPageEvent extends Equatable {
  const RootPageEvent();

  @override
  List<Object> get props => [];
}

class RootPageEventStarted extends RootPageEvent {}

class RootPageEventAuthCheckRequested extends RootPageEvent {}
