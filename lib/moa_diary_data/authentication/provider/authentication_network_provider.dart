import 'package:dio/dio.dart';
import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';

class AuthenticationNetworkProvider extends AuthenticationProvider {
  AuthenticationNetworkProvider({
    required Dio httpClient,
  }) : _httpClient = httpClient;

  final Dio _httpClient;

  @override
  Future<bool> checkEmailDuplication(String email) async {
    final response = await _httpClient.get(
      '/user/check/email/$email',
    );

    return response.data ?? false;
  }

  @override
  Future<void> deleteUser(String email) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<UserDto> fetchUser(String email) async {
    final response = await _httpClient.get('/user/$email');

    return UserDto.fromJson(response.data ?? {});
  }

  @override
  Future<void> modifyUser({
    required String email,
    required UserModifyRequestDto dto,
  }) async {
    await _httpClient.put(
      '/user/$email',
      data: dto.toJson(),
    );
  }

  @override
  Future<void> signUp(
    SignUpRequestDto dto,
  ) async {
    await _httpClient.post(
      '/user/create',
      data: dto.toJson(),
    );
  }
}
