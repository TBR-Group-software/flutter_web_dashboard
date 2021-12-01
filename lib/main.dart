import 'package:flutter/material.dart';

import 'package:flutter_web_dashboard/presentation/page/home_page/page.dart';

void main() {
  runApp(const WebDashboardApp());
}

class WebDashboardApp extends StatelessWidget {
  const WebDashboardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
