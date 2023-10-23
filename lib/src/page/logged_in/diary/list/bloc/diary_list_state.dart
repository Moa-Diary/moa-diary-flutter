part of 'diary_list_bloc.dart';

abstract class DiaryListState extends Equatable {
  const DiaryListState();

  @override
  List<Object?> get props => [];
}

class DiaryListInitial extends DiaryListState {
  @override
  List<Object> get props => [];
}

class DiaryListStateUpdateDiaryList extends DiaryListState {
  const DiaryListStateUpdateDiaryList({
    required this.page,
    required this.diaryList,
    required this.hasMoreResult,
  });

  final int page;
  final List<DiaryDto> diaryList;
  final bool hasMoreResult;

  @override
  List<Object?> get props => [
        page,
        diaryList,
        hasMoreResult,
      ];
}
