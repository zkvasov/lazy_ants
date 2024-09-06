import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../presentation/models/user_session.dart';
import 'storage/tables/user_session_table.dart';

part 'app_storage.g.dart';

@DriftDatabase(
  tables: [
    UserSessionTable,
  ],
)
class AppStorage extends _$AppStorage {
  AppStorage() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
    );
  }

  static QueryExecutor _openConnection() {
    // `driftDatabase` from `package:drift_flutter` stores the database in
    // `getApplicationDocumentsDirectory()`.
    return driftDatabase(name: 'my_database');
  }
}
