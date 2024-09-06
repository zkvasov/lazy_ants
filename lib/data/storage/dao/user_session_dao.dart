import 'package:drift/drift.dart';
import 'package:lazy_ants/data/app_storage.dart';
import 'package:lazy_ants/data/storage/tables/user_session_table.dart';

import '../../../presentation/models/user_session.dart';

part 'user_session_dao.g.dart';

// the _UserSessionDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [UserSessionTable])
class UserSessionDao extends DatabaseAccessor<AppStorage>
    with _$UserSessionDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  UserSessionDao(super.db);

  Future<void> insertSession(UserSession session) async {
    batch((batch) {
      userSessionTable.insertOnConflictUpdate(UserSessionTableCompanion.insert(
        email: Value(session.email),
        password: Value(session.password),
      ));
    });
  }

  Future<UserSession?> getSession() {
    return select(userSessionTable).getSingleOrNull();
  }
}
