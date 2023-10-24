import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';

class DiaryDataRepository extends DiaryRepository {
  DiaryDataRepository({
    required AuthenticationRepository authenticationRepository,
    required DiaryProvider diaryProvider,
  })  : _authenticationRepository = authenticationRepository,
        _diaryProvider = diaryProvider;

  final AuthenticationRepository _authenticationRepository;
  final DiaryProvider _diaryProvider;

  @override
  Future<PaginationResponseDto<DiaryDto>> fetchDiaryList({
    required int page,
    required int size,
    required bool isMine,
  }) async {
    final userId =
        isMine ? _authenticationRepository.currentUser?.userId ?? 0 : 0;

    return _diaryProvider.fetchDiaryList(
      userId: userId,
      page: page,
      size: size,
    );
  }
}
