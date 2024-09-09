import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lazy_ants/core/router/app_router.dart';
import 'package:lazy_ants/core/router/app_router.gr.dart';
import 'package:lazy_ants/data/data_sources/storage/dao/user_session_dao.dart';
import 'package:lazy_ants/data/data_sources/storage/local_storage.dart';
import 'package:lazy_ants/presentation/models/user_session.dart';

import '../../di/di.dart';
import '../bloc/login/login_page_cubit.dart';

enum _LoginPageFields {
  email,
  password,
}

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginPageCubit>(),
      child: this,
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _fbKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: _LoginPageFields.email.name,
                validator: FormBuilderValidators.required(),
                decoration: const InputDecoration(
                  label: Text('Login'),
                ),
              ),
              FormBuilderTextField(
                name: _LoginPageFields.password.name,
                validator: FormBuilderValidators.required(),
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
              ),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  if (_fbKey.currentState?.saveAndValidate() ?? false) {
                    final sessionDao = UserSessionDao(LocalStorage());

                    final email =
                        _fbKey.currentState?.value[_LoginPageFields.email.name];
                    final password = _fbKey
                        .currentState?.value[_LoginPageFields.password.name];

                    sessionDao
                        .insertSession(UserSession(
                      email: email,
                      password: password,
                    ))
                        .then((_) {
                      // TODO: di
                      AppRouter().push(const UsersRoute());
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
