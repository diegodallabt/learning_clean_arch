import '../models/dtos/user_dto.dart';

abstract class GetUsersRepository {
  Future<UserDto> call();
}
