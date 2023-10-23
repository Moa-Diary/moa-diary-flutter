import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';

abstract class DiaryRepository {
  Future<PaginationResponseDto<DiaryDto>> fetchDiaryList({
    required int page,
    required int size,
  });
}