// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:lazy_ants/domain/enteties/users/user.dart' as _i6;
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
class UserDetailsRoute extends _i4.PageRouteInfo<UserDetailsRouteArgs> {
  UserDetailsRoute({
    _i5.Key? key,
    required _i6.User user,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          UserDetailsRoute.name,
          args: UserDetailsRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'UserDetailsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserDetailsRouteArgs>();
      return _i2.UserDetailsPage(
        key: args.key,
        user: args.user,
      );
    },
  );
}

class UserDetailsRouteArgs {
  const UserDetailsRouteArgs({
    this.key,
    required this.user,
  });

  final _i5.Key? key;

  final _i6.User user;

  @override
  String toString() {
    return 'UserDetailsRouteArgs{key: $key, user: $user}';
  }
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
