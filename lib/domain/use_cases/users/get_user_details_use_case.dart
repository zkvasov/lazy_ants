import 'package:injectable/injectable.dart';
import 'package:lazy_ants/domain/enteties/users/user.dart';

import '../../repositories/users_repository.dart';

@lazySingleton
class GetUserDetailsUseCase {
  final UsersRepository _usersRepository;

  GetUserDetailsUseCase(this._usersRepository);

  Future<User> call(int userId) {
    return _usersRepository.getUserDetails(userId);
  }
}
