import 'package:flutter_test/flutter_test.dart';
import 'package:learning_clean_arch/app/modules/users/data/datasources/get_users_datasource.dart';
import 'package:learning_clean_arch/app/modules/users/data/repositories/get_users_repository_impl.dart';
import 'package:learning_clean_arch/app/modules/users/domain/models/dtos/user_dto.dart';
import 'package:learning_clean_arch/app/modules/users/domain/repositories/get_users_repository.dart';
import 'package:learning_clean_arch/app/modules/users/domain/usecases/get_users_usecase.dart';
import 'package:learning_clean_arch/app/modules/users/domain/usecases/get_users_usecase_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_users_mock.dart';
import 'get_users_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetUsersDataSource>()])
void main() {
  late GetUsersDataSource getUsersDataSource;
  late GetUsersRepository getUsersRepositoryImpl;
  late GetUsersUseCase getUsersUseCaseImpl;

  setUp(() {
    getUsersDataSource = MockGetUsersDataSource();
    getUsersRepositoryImpl = GetUsersRepositoryImpl(getUsersDataSource);
    getUsersUseCaseImpl = GetUsersUseCaseImpl(getUsersRepositoryImpl);
  });

  // request success test
  test('request success test', () async {
    when(getUsersDataSource()).thenAnswer((_) async => mock);

    var res = await getUsersUseCaseImpl();

    expect(res.success, isTrue);
    expect(res.body, isA<List<UserDto>>());
  });

  // request error test
  test('request error test', () async {
    when(getUsersDataSource()).thenThrow(Exception("Erro na aplicação"));

    var res = await getUsersUseCaseImpl();

    expect(res.success, isFalse);
    expect(res.body, isNull);
    expect(res.message, isA<String>());
  });
}
