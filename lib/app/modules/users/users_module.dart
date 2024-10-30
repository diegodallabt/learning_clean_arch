import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_clean_arch/app/modules/users/domain/usecases/get_users_usecase.dart';
import '../shared/http/http_client.dart';
import 'data/datasources/get_users_datasource.dart';
import 'data/repositories/get_users_repository_impl.dart';
import 'domain/repositories/get_users_repository.dart';
import 'domain/usecases/get_users_usecase_impl.dart';
import 'external/datasources/get_users_datasource_impl.dart';
import 'presentation/users/users_page.dart';
import 'users_controller.dart';

class UserModule extends Module {
  @override
  void binds(Injector i) {
    // Injeção do Http Client
    i.addSingleton<HttpClientAdaptive>(() => HttpClientAdaptive());

    // Injeção do DataSource
    i.addSingleton<GetUsersDataSource>(
        () => GetUsersDataSourceImpl(i.get<HttpClientAdaptive>()));

    // Injeção do Repository
    i.addSingleton<GetUsersRepository>(
      () => GetUsersRepositoryImpl(i.get<GetUsersDataSource>()),
    );

    // Injeção do UseCase
    i.addSingleton<GetUsersUseCase>(
      () => GetUsersUseCaseImpl(i.get<GetUsersRepository>()),
    );

    // Injeção do Controller
    i.addSingleton<UserController>(
      () => UserController(i.get<GetUsersUseCase>()),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const UserPage());
  }
}
