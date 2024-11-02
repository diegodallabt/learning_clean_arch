import 'package:learning_clean_arch/app/modules/shared/response/response_presentation.dart';

import '../models/dtos/user_dto.dart';
import '../repositories/add_user_repository.dart';
import 'add_user_usecase.dart';

class AddUserUseCaseImpl implements AddUserUseCase {
  AddUserUseCaseImpl(this._addUserRepository);
  final AddUserRepository _addUserRepository;

  @override
  Future<ResponsePresentation> call(UserDto user) async {
    try {
      var res = await _addUserRepository(user);
      return ResponsePresentation(success: true, body: res);
    } on Exception catch (e) {
      return ResponsePresentation(success: false, message: e.toString());
    }
  }
}
