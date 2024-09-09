// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../core/router/app_router.dart' as _i877;
import '../data/data_sources/api_client.dart' as _i550;
import '../data/data_sources/storage/dao/user_session_dao.dart' as _i657;
import '../data/data_sources/storage/local_storage.dart' as _i1022;
import '../domain/repositories/auth_repository.dart' as _i800;
import '../domain/use_cases/auth/get_user_session_use_case.dart' as _i267;
import '../presentation/bloc/login/login_page_cubit.dart' as _i708;
import 'modules/api_module.dart' as _i145;
import 'modules/auto_router_module.dart' as _i448;
import 'modules/logger_module.dart' as _i205;
import 'modules/repositories_module.dart' as _i885;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $configDI(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appRouterModule = _$AppRouterModule();
  final loggerModule = _$LoggerModule();
  final apiModule = _$ApiModule();
  final repositoriesModule = _$RepositoriesModule();
  gh.singleton<_i877.AppRouter>(() => appRouterModule.appRouter());
  gh.singleton<_i974.Logger>(() => loggerModule.logger());
  gh.singleton<_i1022.LocalStorage>(() => _i1022.LocalStorage());
  gh.lazySingleton<_i361.Dio>(() => apiModule.apiDio());
  gh.lazySingleton<_i800.AuthRepository>(
      () => repositoriesModule.chatLocalDataSourceImpl());
  gh.singleton<_i550.ApiClient>(() => _i550.ApiClient(gh<_i361.Dio>()));
  gh.lazySingleton<_i267.GetUserSessionUseCase>(
      () => _i267.GetUserSessionUseCase(gh<_i800.AuthRepository>()));
  gh.lazySingleton<_i657.UserSessionDao>(
      () => _i657.UserSessionDao(gh<_i1022.LocalStorage>()));
  gh.factory<_i708.LoginPageCubit>(
      () => _i708.LoginPageCubit(gh<_i267.GetUserSessionUseCase>()));
  return getIt;
}

class _$AppRouterModule extends _i448.AppRouterModule {}

class _$LoggerModule extends _i205.LoggerModule {}

class _$ApiModule extends _i145.ApiModule {}

class _$RepositoriesModule extends _i885.RepositoriesModule {}
