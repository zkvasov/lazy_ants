import 'package:auto_route/auto_route.dart';

import 'app_auto_router.gr.dart';

// class _AppRoute extends AutoRoute {
//  _AppRoute (
//   {
//     required super.page,
//     required super.path,

//   }
// ) : super();
// }

@AutoRouterConfig()
class AppAutoRouter extends RootStackRouter {
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
        AutoRoute(
          page: UserDetailsRoute.page,
          path: '/user-details',
        ),
      ];
}
