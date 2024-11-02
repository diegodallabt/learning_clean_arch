import '../../../shared/response/response_presentation.dart';
import '../models/dtos/user_dto.dart';

abstract class AddUserUseCase {
  Future<ResponsePresentation> call(UserDto user);
}
