import 'package:dio/dio.dart';
import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';

class AuthenticationNetworkProvider extends AuthenticationProvider {
  AuthenticationNetworkProvider({
    required Dio httpClient,
  })  : _httpClient = httpClient,
        super();

  final Dio _httpClient;

  @override
  Future<void> registerUser(UserRegisterDto dto) async {
    await _httpClient.post(
      '/user/create',
      data: dto,
    );
  }

  @override
  Future<bool> checkEmailDuplicate(String email) async {
    final response = await _httpClient.get('/user/check/email/$email');
    return response.data;
  }
}
