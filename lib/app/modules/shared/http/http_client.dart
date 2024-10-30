import 'package:dio/dio.dart';

class HttpClientAdaptive {
  HttpClientAdaptive() {
    client.options.baseUrl =
        'https://67206d73e7a5792f05317612.mockapi.io/api/v1';
    client.options.connectTimeout = const Duration(seconds: 5);
    client.options.receiveTimeout = const Duration(seconds: 3);
  }

  final client = Dio();

  Future get(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onReceiveProgress}) {
    return client.get(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
  }
}
