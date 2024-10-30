import '../../../shared/response/response_presentation.dart';

abstract class GetUsersUseCase {
  Future<ResponsePresentation> call();
}
