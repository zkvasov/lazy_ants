import 'package:drift/drift.dart';

import '../../../../presentation/models/user_session.dart';

@UseRowClass(UserSession)
class UserSessionTable extends Table {
  TextColumn get email => text()();
  TextColumn get password => text()();
}
