import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moa_diary_app/moa_diary_domain/diary/diary.dart';
import 'package:moa_diary_app/src/page/logged_in/diary/list/enum/enum.dart';

part 'diary_list_event.dart';

part 'diary_list_state.dart';

const _diaryListSizePerPage = 20;

class DiaryListBloc extends Bloc<DiaryListEvent, DiaryListState> {
  DiaryListBloc({
    required this.diaryRepository,
  }) : super(DiaryListInitial()) {
    on<DiaryListEventEntered>(_onEntered);
    on<DiaryListEventTabChanged>(_onTabChanged);
  }

  final DiaryRepository diaryRepository;

  Future<void> _onEntered(
    DiaryListEventEntered event,
    Emitter<DiaryListState> emit,
  ) async {
    try {
      await _fetchDiaryList(
        emit,
        page: 0,
        isMine: true,
      );
    } catch (error, stack) {
      print('hajin ${error.toString()}');
    }
  }

  Future<void> _onTabChanged(
    DiaryListEventTabChanged event,
    Emitter<DiaryListState> emit,
  ) async {
    try {
      final isMine = event.type.isMyDiary;

      await _fetchDiaryList(
        emit,
        page: 0,
        isMine: isMine,
      );
    } catch (error) {}
  }

  Future<void> _fetchDiaryList(
    Emitter<DiaryListState> emit, {
    required int page,
    bool isMine = false,
  }) async {
    final result = await diaryRepository.fetchDiaryList(
      page: page,
      size: _diaryListSizePerPage,
      isMine: isMine,
    );

    emit(DiaryListStateUpdateDiaryList(
      hasMoreResult: result.hasMoreResult,
      page: result.page,
      diaryList: result.content,
    ));
  }
}
