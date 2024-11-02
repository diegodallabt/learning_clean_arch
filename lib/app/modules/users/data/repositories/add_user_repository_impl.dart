import 'package:learning_clean_arch/app/modules/users/data/datasources/add_user_datasource.dart';

import '../../domain/models/dtos/user_dto.dart';
import '../../domain/repositories/add_user_repository.dart';

class AddUserRepositoryImpl implements AddUserRepository {
  AddUserRepositoryImpl(this._addUserDataSource);
  final AddUserDataSource _addUserDataSource;
  @override
  Future<UserDto> call(UserDto user) async {
    try {
      var res = await _addUserDataSource(user);
      return UserDto.fromMap(res);
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      rethrow;
    }
  }
}
