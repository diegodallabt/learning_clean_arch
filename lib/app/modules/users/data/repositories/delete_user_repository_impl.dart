import 'package:learning_clean_arch/app/modules/users/data/datasources/delete_user_datasource.dart';

import '../../domain/models/dtos/user_dto.dart';
import '../../domain/repositories/delete_user_repository.dart';

class DeleteUserRepositoryImpl implements DeleteUserRepository {
  DeleteUserRepositoryImpl(this._deleteUserDataSource);

  final DeleteUserDataSource _deleteUserDataSource;

  @override
  Future<UserDto> call(String id) async {
    try {
      var res = await _deleteUserDataSource(id);

      return UserDto.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }
}
