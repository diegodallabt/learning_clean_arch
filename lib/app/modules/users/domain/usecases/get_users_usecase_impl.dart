import 'package:learning_clean_arch/app/modules/users/domain/repositories/get_users_repository.dart';

import '../../../shared/response/response_presentation.dart';
import 'get_users_usecase.dart';

class GetUsersUseCaseImpl implements GetUsersUseCase {
  GetUsersUseCaseImpl(this._getUsersRepository);

  final GetUsersRepository _getUsersRepository;
  @override
  Future<ResponsePresentation> call() async {
    try {
      var res = await _getUsersRepository();
      return ResponsePresentation(success: true, body: res);
    } on Exception catch (e) {
      return ResponsePresentation(success: false, message: e.toString());
    }
  }
}
