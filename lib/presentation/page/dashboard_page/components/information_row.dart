import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_web_dashboard/presentation/page/dashboard_page/components/information_box.dart';
import 'package:flutter_web_dashboard/presentation/theme/icons.dart';
import 'package:flutter_web_dashboard/presentation/theme/palette.dart';

class InformationRow extends StatelessWidget {
  const InformationRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        InformationBox(
          icon: SvgPicture.asset(WebDashboardIcons.rocketOrange),
          backgroundColor: WebDashboardPalette.orange.withOpacity(0.1),
          number: 21343,
          haveIncreased: true,
          percent: 3.9,
          text: 'Total Installation',
        ),
        InformationBox(
          icon: SvgPicture.asset(WebDashboardIcons.chartPurple),
          backgroundColor: WebDashboardPalette.lightPurple.withOpacity(0.8),
          number: 22424,
          haveIncreased: true,
          percent: 3.9,
          text: 'Total Active Users',
        ),
        InformationBox(
          icon: SvgPicture.asset(WebDashboardIcons.newUserBlue),
          backgroundColor: WebDashboardPalette.lightBlue.withOpacity(0.1),
          number: 353,
          haveIncreased: true,
          percent: 3.9,
          text: 'New Users',
        ),
        InformationBox(
          icon: SvgPicture.asset(WebDashboardIcons.speedometerYellow),
          backgroundColor: WebDashboardPalette.yellow.withOpacity(0.2),
          number: 34,
          showPercent: true,
          haveIncreased: true,
          percent: 3.9,
          text: 'Retention Rate',
        ),
      ],
    );
  }
}
