import 'package:lazy_ants/data/data_sources/api/api_client.dart';
import 'package:lazy_ants/data/data_sources/models/users/address.dart';
import 'package:lazy_ants/data/data_sources/models/users/company.dart';
import 'package:lazy_ants/data/data_sources/models/users/geo.dart';
import 'package:lazy_ants/data/data_sources/storage/dao/users_dao.dart';
import 'package:lazy_ants/domain/enteties/users/address_entity.dart';
import 'package:lazy_ants/domain/enteties/users/company_entity.dart';
import 'package:lazy_ants/domain/enteties/users/user_entity.dart';
import 'package:lazy_ants/domain/repositories/users_repository.dart';

import '../../core/repository/base_repository.dart';
import '../../domain/enteties/users/geo_entity.dart';
import '../data_sources/models/users/user.dart';

class UsersRepositoryImpl extends BaseRepository implements UsersRepository {
  final UsersDao _usersDao;
  final ApiClient _apiClient;

  UsersRepositoryImpl(
    this._usersDao,
    this._apiClient,
  );

  @override
  Future<List<UserEntity>> getUsers() {
    return makeErrorParsedCall(() async {
      List<User> users = await _usersDao.getAllUsers();
      if (users.isEmpty) {
        users = await _apiClient.getUsers();
        await _usersDao.insertUsers(users);
      }
      return users.map(_UserEntityExt.fromUser).toList();
    });
  }
}

extension _UserEntityExt on UserEntity {
  static UserEntity fromUser(User user) {
    return UserEntity(
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
      address: _AddressEntityExt.fromAddress(user.address),
      phone: user.phone,
      website: user.website,
      company: _CompanyEntityExt.fromCompany(user.company),
    );
  }
}

extension _AddressEntityExt on AddressEntity {
  static AddressEntity fromAddress(Address address) {
    return AddressEntity(
      street: address.street,
      suite: address.suite,
      city: address.city,
      zipcode: address.zipcode,
      geo: _GeoEntityExt.fromGeo(address.geo),
    );
  }
}

extension _GeoEntityExt on GeoEntity {
  static GeoEntity fromGeo(Geo geo) {
    return GeoEntity(
      lat: geo.lat,
      lng: geo.lng,
    );
  }
}

extension _CompanyEntityExt on CompanyEntity {
  static CompanyEntity fromCompany(Company company) {
    return CompanyEntity(
      name: company.name,
      catchPhrase: company.catchPhrase,
      bs: company.bs,
    );
  }
}
