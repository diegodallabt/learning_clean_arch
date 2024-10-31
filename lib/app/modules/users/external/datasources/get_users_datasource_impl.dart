import '../../../shared/http/http_client.dart';
import '../../data/datasources/get_users_datasource.dart';

class GetUsersDataSourceImpl implements GetUsersDataSource {
  GetUsersDataSourceImpl(this._client);
  final HttpClientAdaptive _client;

  @override
  Future<List<Map<String, dynamic>>> call() async {
    var res = await _client.get('/users');
    return List.from(res);
  }
}
