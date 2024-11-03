import '../../data/datasources/update_user_datasource.dart';

import '../../domain/models/dtos/user_dto.dart';
import '../../domain/repositories/update_user_repository.dart';

class UpdateUserRepositoryImpl implements UpdateUserRepository {
  UpdateUserRepositoryImpl(this._updateUserDataSource);

  final UpdateUserDataSource _updateUserDataSource;
  @override
  Future<UserDto> call(UserDto user) async {
    try {
      var res = await _updateUserDataSource(user);
      return UserDto.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }
}
