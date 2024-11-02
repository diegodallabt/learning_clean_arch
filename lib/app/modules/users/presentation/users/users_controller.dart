import 'package:flutter/foundation.dart';

import '../../domain/models/dtos/user_dto.dart';
import '../../domain/usecases/get_users_usecase.dart';

class UserController {
  UserController(this._getUsersUseCase);
  final GetUsersUseCase _getUsersUseCase;

  List<UserDto> contacts = [];

  Future<void> getData() async {
    var res = await _getUsersUseCase();

    if (!res.success) {
      contacts = [];
      if (kDebugMode) {
        print(res.message);
      }
      return;
    }

    contacts = res.body as List<UserDto>;

    // Ordenação apenas para fins estéticos
    contacts.sort((a, b) => a.name!.compareTo(b.name!));
  }
}
