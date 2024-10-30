import 'domain/models/dtos/user_dto.dart';
import 'domain/usecases/get_users_usecase.dart';

class UserController {
  UserController(this._getUsersUseCase);
  final GetUsersUseCase _getUsersUseCase;

  List<UserDto> contacts = [];

  Future<void> getData() async {
    var res = await _getUsersUseCase();

    if (!res.success) {
      contacts = [];
      print(res.message);
    }

    contacts = res.body;

    // Ordenação apenas para fins estéticos
    contacts.sort((a, b) => a.name!.compareTo(b.name!));
  }
}
