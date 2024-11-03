import '../../../shared/response/response_presentation.dart';

abstract class DeleteUserUseCase {
  Future<ResponsePresentation> call(String id);
}
