import 'package:injectable/injectable.dart';

import '../../core/router/app_auto_router.dart';

@module
abstract class AppRouterModule {
  @singleton
  AppAutoRouter appAutoRouter() => AppAutoRouter();
}
