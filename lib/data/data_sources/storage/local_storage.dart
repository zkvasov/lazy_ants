import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../presentation/models/user_session.dart';
import 'tables/user_session_table.dart';

part 'local_storage.g.dart';

@singleton
@DriftDatabase(
  tables: [
    UserSessionTable,
  ],
)
class LocalStorage extends _$LocalStorage {
  LocalStorage() : super(_openConnection());

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
    return driftDatabase(name: 'my_database');
  }
}
