import 'package:dio/dio.dart';

import '../../data/datasources/get_users_datasource.dart';

class GetUsersDataSourceImpl implements GetUsersDataSource {
  GetUsersDataSourceImpl() {
    httpClient.options.baseUrl =
        'https://67206d73e7a5792f05317612.mockapi.io/api/v1';
    httpClient.options.connectTimeout = const Duration(seconds: 5);
    httpClient.options.receiveTimeout = const Duration(seconds: 3);
  }
  final httpClient = Dio();

  @override
  Future<Map<String, dynamic>> call() async {
    var res = await httpClient.get('/users');
    return res.data;
  }
}
