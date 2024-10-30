import '../datasources/get_users_datasource.dart';

import '../../domain/models/dtos/user_dto.dart';
import '../../domain/repositories/get_users_repository.dart';

class GetUsersRepositoryImpl implements GetUsersRepository {
  GetUsersRepositoryImpl(this._getUsersDataSource);

  final GetUsersDataSource _getUsersDataSource;

  @override
  Future<List<UserDto>> call() async {
    try {
      var res = await _getUsersDataSource();
      List<UserDto> list = [];

      return res.map((e) => UserDto.fromMap(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
