// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_storage.dart';

// ignore_for_file: type=lint
class $UserSessionTableTable extends UserSessionTable
    with TableInfo<$UserSessionTableTable, UserSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSessionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [email, password];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_session_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserSession> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserSession(
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password']),
    );
  }

  @override
  $UserSessionTableTable createAlias(String alias) {
    return $UserSessionTableTable(attachedDatabase, alias);
  }
}

class UserSessionTableCompanion extends UpdateCompanion<UserSession> {
  final Value<String?> email;
  final Value<String?> password;
  final Value<int> rowid;
  const UserSessionTableCompanion({
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserSessionTableCompanion.insert({
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<UserSession> custom({
    Expression<String>? email,
    Expression<String>? password,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserSessionTableCompanion copyWith(
      {Value<String?>? email, Value<String?>? password, Value<int>? rowid}) {
    return UserSessionTableCompanion(
      email: email ?? this.email,
      password: password ?? this.password,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSessionTableCompanion(')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppStorage extends GeneratedDatabase {
  _$AppStorage(QueryExecutor e) : super(e);
  $AppStorageManager get managers => $AppStorageManager(this);
  late final $UserSessionTableTable userSessionTable =
      $UserSessionTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userSessionTable];
}

typedef $$UserSessionTableTableCreateCompanionBuilder
    = UserSessionTableCompanion Function({
  Value<String?> email,
  Value<String?> password,
  Value<int> rowid,
});
typedef $$UserSessionTableTableUpdateCompanionBuilder
    = UserSessionTableCompanion Function({
  Value<String?> email,
  Value<String?> password,
  Value<int> rowid,
});

class $$UserSessionTableTableFilterComposer
    extends FilterComposer<_$AppStorage, $UserSessionTableTable> {
  $$UserSessionTableTableFilterComposer(super.$state);
  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get password => $state.composableBuilder(
      column: $state.table.password,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserSessionTableTableOrderingComposer
    extends OrderingComposer<_$AppStorage, $UserSessionTableTable> {
  $$UserSessionTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get password => $state.composableBuilder(
      column: $state.table.password,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$UserSessionTableTableTableManager extends RootTableManager<
    _$AppStorage,
    $UserSessionTableTable,
    UserSession,
    $$UserSessionTableTableFilterComposer,
    $$UserSessionTableTableOrderingComposer,
    $$UserSessionTableTableCreateCompanionBuilder,
    $$UserSessionTableTableUpdateCompanionBuilder,
    (
      UserSession,
      BaseReferences<_$AppStorage, $UserSessionTableTable, UserSession>
    ),
    UserSession,
    PrefetchHooks Function()> {
  $$UserSessionTableTableTableManager(
      _$AppStorage db, $UserSessionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserSessionTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserSessionTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String?> email = const Value.absent(),
            Value<String?> password = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserSessionTableCompanion(
            email: email,
            password: password,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String?> email = const Value.absent(),
            Value<String?> password = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserSessionTableCompanion.insert(
            email: email,
            password: password,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserSessionTableTableProcessedTableManager = ProcessedTableManager<
    _$AppStorage,
    $UserSessionTableTable,
    UserSession,
    $$UserSessionTableTableFilterComposer,
    $$UserSessionTableTableOrderingComposer,
    $$UserSessionTableTableCreateCompanionBuilder,
    $$UserSessionTableTableUpdateCompanionBuilder,
    (
      UserSession,
      BaseReferences<_$AppStorage, $UserSessionTableTable, UserSession>
    ),
    UserSession,
    PrefetchHooks Function()>;

class $AppStorageManager {
  final _$AppStorage _db;
  $AppStorageManager(this._db);
  $$UserSessionTableTableTableManager get userSessionTable =>
      $$UserSessionTableTableTableManager(_db, _db.userSessionTable);
}
