// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:lazy_ants/presentation/pages/login_page.dart' as _i1;
import 'package:lazy_ants/presentation/pages/user_details_page.dart' as _i2;
import 'package:lazy_ants/presentation/pages/users_page.dart' as _i3;

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return _i4.WrappedRoute(child: const _i1.LoginPage());
    },
  );
}

/// generated route for
/// [_i2.UserDetailsPage]
class UserDetailsRoute extends _i4.PageRouteInfo<void> {
  const UserDetailsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          UserDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserDetailsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.UserDetailsPage();
    },
  );
}

/// generated route for
/// [_i3.UsersPage]
class UsersRoute extends _i4.PageRouteInfo<void> {
  const UsersRoute({List<_i4.PageRouteInfo>? children})
      : super(
          UsersRoute.name,
          initialChildren: children,
        );

  static const String name = 'UsersRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return _i4.WrappedRoute(child: const _i3.UsersPage());
    },
  );
}
