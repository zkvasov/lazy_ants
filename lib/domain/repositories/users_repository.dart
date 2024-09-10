import 'package:lazy_ants/domain/enteties/users/user_entity.dart';

abstract class UsersRepository {
  Future<List<UserEntity>> getUsers();
}
