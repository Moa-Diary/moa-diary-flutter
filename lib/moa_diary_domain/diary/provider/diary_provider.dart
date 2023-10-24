import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';

abstract class DiaryProvider {
  Future<PaginationResponseDto<DiaryDto>> fetchDiaryList({
    required int userId,
    required int page,
    required int size,
  });
}
