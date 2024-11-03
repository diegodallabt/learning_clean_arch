import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_clean_arch/app/modules/users/data/repositories/add_user_repository_impl.dart';
import 'package:learning_clean_arch/app/modules/users/data/repositories/delete_user_repository_impl.dart';
import 'package:learning_clean_arch/app/modules/users/domain/usecases/add_user_usecase_impl.dart';
import 'package:learning_clean_arch/app/modules/users/domain/usecases/delete_user_usecase.dart';
import 'package:learning_clean_arch/app/modules/users/domain/usecases/delete_user_usecase_impl.dart';
import 'package:learning_clean_arch/app/modules/users/domain/usecases/get_users_usecase.dart';
import 'package:learning_clean_arch/app/modules/users/external/datasources/delete_user_datasource_impl.dart';
import 'package:learning_clean_arch/app/modules/users/presentation/add_user/add_controller.dart';
import 'package:learning_clean_arch/app/modules/users/presentation/add_user/add_page.dart';
import '../shared/http/http_client.dart';
import 'data/datasources/add_user_datasource.dart';
import 'data/datasources/delete_user_datasource.dart';
import 'data/datasources/get_users_datasource.dart';
import 'data/repositories/get_users_repository_impl.dart';
import 'domain/repositories/add_user_repository.dart';
import 'domain/repositories/delete_user_repository.dart';
import 'domain/repositories/get_users_repository.dart';
import 'domain/usecases/add_user_usecase.dart';
import 'domain/usecases/get_users_usecase_impl.dart';
import 'external/datasources/add_user_datasource_impl.dart';
import 'external/datasources/get_users_datasource_impl.dart';
import 'presentation/users/users_page.dart';
import 'presentation/users/users_controller.dart';

class UserModule extends Module {
  @override
  void binds(Injector i) {
    // HttpClient
    i.addSingleton<HttpClientAdaptive>(() => HttpClientAdaptive());

    // Datasources DI
    i.addSingleton<GetUsersDataSource>(
        () => GetUsersDataSourceImpl(i.get<HttpClientAdaptive>()));

    i.addSingleton<AddUserDataSource>(
        () => AddUserDataSourceImpl(i.get<HttpClientAdaptive>()));

    i.addSingleton<DeleteUserDataSource>(
        () => DeleteUserDataSourceImpl(i.get<HttpClientAdaptive>()));

    // Repositorys DI
    i.addSingleton<GetUsersRepository>(
      () => GetUsersRepositoryImpl(i.get<GetUsersDataSource>()),
    );

    i.addSingleton<AddUserRepository>(
        () => AddUserRepositoryImpl(i.get<AddUserDataSource>()));

    i.addSingleton<DeleteUserRepository>(
        () => DeleteUserRepositoryImpl(i.get<DeleteUserDataSource>()));

    // UseCases DI
    i.addSingleton<GetUsersUseCase>(
      () => GetUsersUseCaseImpl(i.get<GetUsersRepository>()),
    );

    i.addSingleton<AddUserUseCase>(
        () => AddUserUseCaseImpl(i.get<AddUserRepository>()));

    i.addSingleton<DeleteUserUseCase>(
        () => DeleteUserUseCaseImpl(i.get<DeleteUserRepository>()));

    // Controllers DI
    i.addSingleton<UserController>(
      () =>
          UserController(i.get<GetUsersUseCase>(), i.get<DeleteUserUseCase>()),
    );

    i.addSingleton<AddController>(
      () => AddController(i.get<AddUserUseCase>()),
    );
  }

  @override
  void routes(RouteManager r) {
    final instantTransition = CustomTransition(
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
      transitionDuration: Duration.zero,
    );

    r.child(
      '/',
      child: (context) => const UserPage(),
      customTransition: instantTransition,
    );
    r.child(
      '/add',
      child: (context) => const AddPage(),
      customTransition: instantTransition,
    );
  }
}
