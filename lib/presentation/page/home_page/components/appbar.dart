import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_dashboard/presentation/theme/icons.dart';

class WebDashBoardAppBar extends StatelessWidget {
  const WebDashBoardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 25),
          child: SvgPicture.asset(WebDashboardIcons.homeTeamNs),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              SvgPicture.asset(WebDashboardIcons.bell),
              const CircleAvatar(backgroundColor: Colors.green, radius: 20),
            ],
          ),
        ),
      ],
    );
  }
}
