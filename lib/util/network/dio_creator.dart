import 'dart:io';

import 'package:dio/dio.dart';

const _defaultConnectTimeout = Duration(seconds: 10);
const _defaultSendTimeout = Duration(seconds: 10);
const _defaultReceiveTimeout = Duration(seconds: 10);

class DioCreator {
  static Dio create(
    String baseUrl,
    List<Interceptor>? interceptors,
  ) {
    Dio client = Dio();

    client
    ..options.baseUrl = baseUrl
    ..options.connectTimeout = _defaultConnectTimeout
    ..options.sendTimeout = _defaultSendTimeout
    ..options.receiveTimeout = _defaultReceiveTimeout
    ..options.responseType = ResponseType.json
    ..options.contentType = 'application/json';

    client.interceptors.addAll(interceptors ?? []);

    return client;
  }
}
