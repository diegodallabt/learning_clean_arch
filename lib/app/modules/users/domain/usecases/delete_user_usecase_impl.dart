import '../../../shared/response/response_presentation.dart';
import '../repositories/delete_user_repository.dart';

import 'delete_user_usecase.dart';

class DeleteUserUseCaseImpl implements DeleteUserUseCase {
  DeleteUserUseCaseImpl(this._deleteUserRepository);

  final DeleteUserRepository _deleteUserRepository;

  @override
  Future<ResponsePresentation> call(String id) async {
    try {
      var res = await _deleteUserRepository(id);
      return ResponsePresentation(success: true, body: res);
    } catch (e) {
      return ResponsePresentation(success: false, message: e.toString());
    }
  }
}
