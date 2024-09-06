import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

// class _AppRoute extends AutoRoute {
//  _AppRoute (
//   {
//     required super.page,
//     required super.path,

//   }
// ) : super();
// }

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: UsersRoute.page,
          path: '/users',
        ),
      ];
}
