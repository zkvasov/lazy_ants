import 'package:injectable/injectable.dart';
import 'package:lazy_ants/domain/enteties/users/user_entity.dart';

import '../../repositories/users_repository.dart';

@lazySingleton
class GetUsersUseCase {
  final UsersRepository _usersRepository;

  GetUsersUseCase(this._usersRepository);

  Future<List<UserEntity>> call() {
    return _usersRepository.getUsers();
  }
}
