import '../../domain/models/dtos/user_dto.dart';

abstract class UpdateUserDataSource {
  Future<Map<String, dynamic>> call(UserDto user);
}
