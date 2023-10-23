part of 'diary_list_bloc.dart';

abstract class DiaryListEvent extends Equatable {
  const DiaryListEvent();

  @override
  List<Object?> get props => [];
}

class DiaryListEventEntered extends DiaryListEvent {}

class DiaryListEventFetchRequested extends DiaryListEvent {}
