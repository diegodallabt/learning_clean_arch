import '../models/dtos/user_dto.dart';

abstract class AddUserRepository {
  Future<UserDto> call(UserDto user);
}
