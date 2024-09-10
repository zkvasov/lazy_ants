import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:lazy_ants/data/data_sources/models/users/address.dart';
import 'package:lazy_ants/data/data_sources/models/users/company.dart';
import 'package:lazy_ants/data/data_sources/models/users/geo.dart';
import 'package:lazy_ants/data/data_sources/storage/local_storage.dart';
import 'package:lazy_ants/data/data_sources/storage/tables/users/addresses_table.dart';
import 'package:lazy_ants/data/data_sources/storage/tables/users/companies_table.dart';
import 'package:lazy_ants/data/data_sources/storage/tables/users/geos_table.dart';
import 'package:lazy_ants/data/data_sources/storage/tables/users/users_table.dart';

import '../../models/users/user.dart';
import '../views/indicators_view.dart';

part 'users_dao.g.dart';

@lazySingleton
@DriftAccessor(
  tables: [
    Users,
    Addresses,
    Geos,
    Companies,
  ],
  views: [
    IndicatorsView,
  ],
)
class UsersDao extends DatabaseAccessor<LocalStorage> with _$UsersDaoMixin {
  UsersDao(super.db);

  Future<void> insertUsers(List<User> userList) async {
    await batch((batch) async {
      batch.insertAllOnConflictUpdate(
        users,
        await Future.wait(userList.map(
          (user) async {
            final geoId =
                await into(geos).insert(user.address.geo.toInsertGeo());
            final addressId = await into(addresses)
                .insert(user.address.toInsertAddress(geoId));
            final companyId =
                await into(companies).insert(user.company.toInsertCompany());

            return UsersCompanion.insert(
              name: user.name,
              username: user.username,
              email: user.email,
              addressId: addressId,
              phone: user.phone,
              website: user.website,
              companyId: companyId,
            );
          },
        )),
      );
    });
  }

  Future<List<User>> getAllUsers() async {
    final views = await indicatorsView.select().get();
    return views.map(UserExt.fromIndicatorsViewData).toList();
  }
}

extension on Geo {
  GeosCompanion toInsertGeo() {
    return GeosCompanion.insert(
      lat: lat,
      lng: lng,
    );
  }
}

extension on Address {
  AddressesCompanion toInsertAddress(int geoId) {
    return AddressesCompanion.insert(
      street: street,
      suite: suite,
      city: city,
      zipcode: zipcode,
      geoId: geoId,
    );
  }
}

extension on Company {
  CompaniesCompanion toInsertCompany() {
    return CompaniesCompanion.insert(
        name: name, catchPhrase: catchPhrase, bs: bs);
  }
}

extension UserExt on User {
  static User fromIndicatorsViewData(IndicatorsViewData view) {
    return User(
      id: view.id,
      name: view.name,
      username: view.username,
      email: view.email,
      address: Address(
          street: view.street,
          suite: view.suite,
          city: view.city,
          zipcode: view.zipcode,
          geo: Geo(lat: view.lat, lng: view.lng)),
      phone: view.phone,
      website: view.website,
      company: Company(
        name: view.name1,
        catchPhrase: view.catchPhrase,
        bs: view.bs,
      ),
    );
  }
}
