import 'package:learning_clean_arch/app/modules/shared/response/response_presentation.dart';
import 'package:learning_clean_arch/app/modules/users/domain/models/dtos/user_dto.dart';
import 'package:learning_clean_arch/app/modules/users/domain/usecases/add_user_usecase.dart';
import 'package:learning_clean_arch/app/modules/users/domain/usecases/update_user_usecase.dart';

class AddController {
  AddController(this._addUserUseCase, this._updateUserUseCase);

  final AddUserUseCase _addUserUseCase;
  final UpdateUserUseCase _updateUserUseCase;

  Future<ResponsePresentation> addContact(UserDto user) async {
    return await _addUserUseCase(user);
  }

  Future<ResponsePresentation> updateContact(UserDto user) async {
    return await _updateUserUseCase(user);
  }
}
