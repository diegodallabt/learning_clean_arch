import '../models/dtos/user_dto.dart';

abstract class DeleteUserRepository {
  Future<UserDto> call(String id);
}
