import 'package:dio/dio.dart';
import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';

class DiaryNetworkProvider extends DiaryProvider {
  DiaryNetworkProvider({
    required Dio httpClient,
  }) : _httpClient = httpClient;

  final Dio _httpClient;

  @override
  Future<PaginationResponseDto<DiaryDto>> fetchDiaryList({
    required int userId,
    required int page,
    required int size,
  }) async {
    final result = await _httpClient.get(
      '/diary/user/$userId',
      queryParameters: {
        'page': page,
        'size': size,
      },
    );

    return PaginationResponseDto<DiaryDto>.fromJson(result.data ?? {});
  }
}
