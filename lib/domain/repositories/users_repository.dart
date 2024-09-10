import 'package:lazy_ants/domain/enteties/users/user.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers();
}
