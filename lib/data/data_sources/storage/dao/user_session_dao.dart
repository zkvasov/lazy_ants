import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:lazy_ants/data/data_sources/storage/local_storage.dart';
import 'package:lazy_ants/data/data_sources/storage/tables/user_session_table.dart';

import '../../../../presentation/models/user_session.dart';

part 'user_session_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [UserSessionTable])
class UserSessionDao extends DatabaseAccessor<LocalStorage>
    with _$UserSessionDaoMixin {
  UserSessionDao(super.db);

  Future<void> insertSession(UserSession session) async {
    batch((batch) {
      userSessionTable.insertOnConflictUpdate(UserSessionTableCompanion.insert(
        email: session.email,
        password: session.password,
      ));
    });
  }

  Future<UserSession?> getSession() {
    return select(userSessionTable).getSingleOrNull();
  }
}
