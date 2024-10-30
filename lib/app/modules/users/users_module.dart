import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_clean_arch/app/modules/users/domain/usecases/get_users_usecase.dart';
import 'data/datasources/get_users_datasource.dart';
import 'data/repositories/get_users_repository_impl.dart';
import 'domain/repositories/get_users_repository.dart';
import 'domain/usecases/get_users_usecase_impl.dart';
import 'external/datasources/get_users_datasource_impl.dart';
import 'presentation/users/users_page.dart';

class UserModule extends Module {
  @override
  void binds(Injector i) {
    // Injeção do DataSource
    i.addSingleton<GetUsersDataSource>(() => GetUsersDataSourceImpl());

    // Injeção do Repository
    i.addSingleton<GetUsersRepository>(
      () => GetUsersRepositoryImpl(i.get<GetUsersDataSource>()),
    );

    // Injeção do UseCase
    i.addSingleton<GetUsersUseCase>(
      () => GetUsersUseCaseImpl(i.get<GetUsersRepository>()),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const UserPage());
  }
}
