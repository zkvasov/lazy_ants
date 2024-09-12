import 'package:injectable/injectable.dart';
import 'package:lazy_ants/domain/entities/users/user.dart';

import '../../repositories/users_repository.dart';

@lazySingleton
class GetUsersUseCase {
  final UsersRepository _usersRepository;

  GetUsersUseCase(this._usersRepository);

  Future<List<User>> call() {
    return _usersRepository.getUsers();
  }
}
