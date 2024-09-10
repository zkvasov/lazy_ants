import 'package:lazy_ants/data/data_sources/api/api_client.dart';
import 'package:lazy_ants/data/data_sources/storage/dao/users_dao.dart';
import 'package:lazy_ants/domain/enteties/users/user.dart';
import 'package:lazy_ants/domain/repositories/users_repository.dart';

import '../core/repository/base_repository.dart';
import '../data_sources/models/users/user_dto.dart';

class UsersRepositoryImpl extends BaseRepository implements UsersRepository {
  final UsersDao _usersDao;
  final ApiClient _apiClient;

  UsersRepositoryImpl(
    this._usersDao,
    this._apiClient,
  );

  @override
  Future<List<User>> getUsers() {
    return makeErrorParsedCall(() async {
      List<UserDto> users = await _usersDao.getAllUsers();
      if (users.isEmpty) {
        users = await _apiClient.getUsers();
        await _usersDao.insertUsers(users);
      }
      return users.map(_UserEntityExt.fromUserDto).toList();
    });
  }

  @override
  Future<User> getUserDetails(int userId) {
    return makeErrorParsedCall(() async {
      final user = await _usersDao.getUserById(userId);
      return _UserEntityExt.fromUserDto(user);
    });
  }
}

extension _UserEntityExt on User {
  static User fromUserDto(UserDto user) {
    return User(
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
      address:
          '${user.address.street}, ${user.address.suite}, ${user.address.city}',
      phone: user.phone,
      website: user.website,
      company: user.company.name,
    );
  }
}
