import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moa_diary_app/moa_diary_domain/diary/diary.dart';

part 'diary_list_event.dart';

part 'diary_list_state.dart';

const _diaryListSizePerPage = 20;

class DiaryListBloc extends Bloc<DiaryListEvent, DiaryListState> {
  DiaryListBloc({
    required this.diaryRepository,
  }) : super(DiaryListInitial()) {
    on<DiaryListEventEntered>(_onEntered);
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
      );
    } catch (error, stack) {}
  }

  Future<void> _fetchDiaryList(
    Emitter<DiaryListState> emit, {
    required int page,
  }) async {
    final result = await diaryRepository.fetchDiaryList(
      page: page,
      size: _diaryListSizePerPage,
    );

    emit(DiaryListStateUpdateDiaryList(
      hasMoreResult: result.hasMoreResult,
      page: result.page,
      diaryList: result.content,
    ));
  }
}
