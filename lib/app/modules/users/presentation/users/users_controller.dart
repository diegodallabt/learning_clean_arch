import 'package:flutter/foundation.dart';
import 'package:learning_clean_arch/app/modules/shared/response/response_presentation.dart';
import 'package:learning_clean_arch/app/modules/users/domain/usecases/delete_user_usecase.dart';

import '../../domain/models/dtos/user_dto.dart';
import '../../domain/usecases/get_users_usecase.dart';

class UserController {
  UserController(this._getUsersUseCase, this._deleteUserUseCase);

  final GetUsersUseCase _getUsersUseCase;
  final DeleteUserUseCase _deleteUserUseCase;

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

    contacts.sort((a, b) => a.name!.compareTo(b.name!));
  }

  Future<ResponsePresentation> deleteData(String? id) async {
    if (id == null) {
      return ResponsePresentation(success: false, message: "ERRO: ID nulo.");
    }
    var res = await _deleteUserUseCase(id);
    if (!res.success) {
      return ResponsePresentation(success: false, message: res.message);
    }

    return ResponsePresentation(
        success: true, message: "Contato deletado com sucesso.");
  }
}
