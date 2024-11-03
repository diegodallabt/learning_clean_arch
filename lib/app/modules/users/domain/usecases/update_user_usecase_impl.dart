import '../../../shared/response/response_presentation.dart';
import '../../domain/repositories/update_user_repository.dart';

import '../models/dtos/user_dto.dart';
import 'update_user_usecase.dart';

class UpdateUserUseCaseImpl implements UpdateUserUseCase {
  UpdateUserUseCaseImpl(this._updateUserRepository);

  final UpdateUserRepository _updateUserRepository;
  @override
  Future<ResponsePresentation> call(UserDto user) async {
    try {
      var res = await _updateUserRepository(user);
      return ResponsePresentation(success: true, body: res);
    } catch (e) {
      return ResponsePresentation(success: false, message: e.toString());
    }
  }
}
