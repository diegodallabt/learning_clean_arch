import '../../../shared/http/http_client.dart';

import '../../data/datasources/update_user_datasource.dart';
import '../../domain/models/dtos/user_dto.dart';

class UpdateUserDataSourceImpl implements UpdateUserDataSource {
  UpdateUserDataSourceImpl(this._client);

  final HttpClientAdaptive _client;
  @override
  Future<Map<String, dynamic>> call(UserDto user) async {
    var res = await _client.put('/users/${user.id}', data: user.toMap());

    return Map.from(res);
  }
}
