import '../../../shared/http/http_client.dart';
import '../../data/datasources/add_user_datasource.dart';
import '../../domain/models/dtos/user_dto.dart';

class AddUserDataSourceImpl implements AddUserDataSource {
  AddUserDataSourceImpl(this._client);
  final HttpClientAdaptive _client;

  @override
  Future<Map<String, dynamic>> call(UserDto user) async {
    var res = await _client.post('/users', data: user.toMap());

    return Map.from(res);
  }
}
