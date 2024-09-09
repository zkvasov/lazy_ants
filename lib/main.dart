import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazy_ants/di/di.dart';

import 'core/router/app_router.dart';

Future<void> main() async {
  await configDI();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // TODO: di
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
