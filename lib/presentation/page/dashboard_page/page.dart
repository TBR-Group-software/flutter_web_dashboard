import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../dummy_data/charts_data.dart';
import '../../theme/gen/assets.gen.dart';
import '../../theme/palette.dart';
import '../../theme/text_styles.dart';
import '../../widget/name_and_color_row.dart';
import 'components/active_users_box.dart';

part 'components/devices_box.dart';
part 'components/information_box.dart';
part 'components/information_row.dart';
part 'components/platforms_box.dart';
part 'components/statistics_box/box.dart';
part 'components/statistics_box/demographics.dart';
part 'components/statistics_box/interests.dart';
part 'components/statistics_box/location.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Text(
            'Welcome back!',
            style: TextStyles.myriadProSemiBold32DarkBlue,
          ),
        ),
        SizedBox(height: 28),
        _InformationRow(),
        SizedBox(height: 22),
        Wrap(
          spacing: 22,
          runSpacing: 22,
          children: <Widget>[
            _StatisticsBox(),
            _PlatformsBox(),
          ],
        ),
        SizedBox(height: 22),
        Wrap(
          spacing: 22,
          runSpacing: 22,
          children: <Widget>[
            _DevicesBox(),
            ActiveUsersBox(),
          ],
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
