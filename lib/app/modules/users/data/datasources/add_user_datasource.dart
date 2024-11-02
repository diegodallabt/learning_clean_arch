import '../../domain/models/dtos/user_dto.dart';

abstract class AddUserDataSource {
  Future<Map<String, dynamic>> call(UserDto user);
}
