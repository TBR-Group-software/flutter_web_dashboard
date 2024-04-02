import 'package:flutter/material.dart';

import '../routes/app_router.dart';

class WebDashboardApp extends StatefulWidget {
  const WebDashboardApp({super.key});

  @override
  State<WebDashboardApp> createState() => _WebDashboardAppState();
}

class _WebDashboardAppState extends State<WebDashboardApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Web dashboard',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
