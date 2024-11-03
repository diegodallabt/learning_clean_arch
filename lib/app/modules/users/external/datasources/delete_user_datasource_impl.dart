import 'package:learning_clean_arch/app/modules/shared/http/http_client.dart';

import '../../data/datasources/delete_user_datasource.dart';

class DeleteUserDataSourceImpl implements DeleteUserDataSource {
  DeleteUserDataSourceImpl(this._client);

  final HttpClientAdaptive _client;
  @override
  Future<Map<String, dynamic>> call(String id) async {
    var res = await _client.delete('/users/$id');

    return Map.from(res);
  }
}
