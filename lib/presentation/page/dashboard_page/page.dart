import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/presentation/page/dashboard_page/components/devices_box.dart';
import 'package:flutter_web_dashboard/presentation/page/dashboard_page/components/information_row.dart';

import 'package:flutter_web_dashboard/presentation/page/dashboard_page/components/platforms_box.dart';
import 'package:flutter_web_dashboard/presentation/page/dashboard_page/components/statistics_box/page.dart';
import 'package:flutter_web_dashboard/presentation/theme/text_styles.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 20, 40),
      child: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 120.0),
            child: Text(
              'Welcome back!',
              style: TextStyles.myriadProSemiBold32DarkBlue,
            ),
          ),
          const SizedBox(height: 28),
          const InformationRow(),
          const SizedBox(height: 22),
          Wrap(
            spacing: 22,
            runSpacing: 22,
            children: const <Widget>[
              StatisticsBox(),
              PlatformsBox(),
            ],
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 22,
            runSpacing: 22,
            children: const <Widget>[
              DevicesBox(),
            ],
          ),
        ],
      ),
    );
  }
}
