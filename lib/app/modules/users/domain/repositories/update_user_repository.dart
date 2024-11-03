import '../models/dtos/user_dto.dart';

abstract class UpdateUserRepository {
  Future<UserDto> call(UserDto user);
}
