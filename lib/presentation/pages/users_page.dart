import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_ants/presentation/widgets/app_loader.dart';

import '../../core/helpers/app_toasts.dart';
import '../../di/di.dart';
import '../bloc/users_page/users_page_cubit.dart';

@RoutePage()
class UsersPage extends StatelessWidget implements AutoRouteWrapper {
  const UsersPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UsersPageCubit>(),
      child: this,
    );
  }

  void _onStateChanged(
    BuildContext context,
    UsersPageState state,
  ) {
    switch (state.status) {
      case UsersPageStatus.error:
        AppToasts.of(context).showError(state.errorMessage);
        break;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: BlocConsumer<UsersPageCubit, UsersPageState>(
        listener: _onStateChanged,
        builder: (context, state) {
          if (state.status == UsersPageStatus.loading) {
            return const Center(
              child: AppLoader(),
            );
          }

          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              final user = state.users[index];
              return Text(user.name);
            },
          );
        },
      ),
    );
  }
}
