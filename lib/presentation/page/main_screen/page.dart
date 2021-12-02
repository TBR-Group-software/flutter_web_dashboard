import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/presentation/page/dashboard_page/page.dart';

import 'package:flutter_web_dashboard/presentation/page/main_screen/components/appbar.dart';
import 'package:flutter_web_dashboard/presentation/page/main_screen/components/navigation_menu.dart';
import 'package:flutter_web_dashboard/presentation/theme/palette.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 220,
                height: double.infinity,
                color: WebDashboardPalette.darkBlue,
                child: const NavigationMenu(),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  color: WebDashboardPalette.background,
                  child: const DashboardPage(),
                ),
              ),
            ],
          ),
          Column(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20, left: 45, right: 25),
                child: WebDashboardAppBar(),
              ),
              SizedBox(height: 10),
              Divider(
                color: WebDashboardPalette.lightGrey,
                indent: 0.5,
                thickness: 0.2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
