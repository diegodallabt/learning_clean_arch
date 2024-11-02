import 'package:learning_clean_arch/app/modules/shared/response/response_presentation.dart';
import 'package:learning_clean_arch/app/modules/users/domain/models/dtos/user_dto.dart';
import 'package:learning_clean_arch/app/modules/users/domain/usecases/add_user_usecase.dart';

class AddController {
  AddController(this._addUserUseCase);

  final AddUserUseCase _addUserUseCase;

  Future<ResponsePresentation> addContact(UserDto user) async {
    return await _addUserUseCase(user);
  }
}
