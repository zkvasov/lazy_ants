import 'package:injectable/injectable.dart';

import '../../core/router/app_router.dart';

@module
abstract class AppRouterModule {
  @singleton
  AppRouter appRouter() => AppRouter();
}
