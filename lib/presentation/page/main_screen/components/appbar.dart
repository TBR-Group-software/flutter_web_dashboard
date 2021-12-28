import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_web_dashboard/presentation/theme/icons.dart';
import 'package:flutter_web_dashboard/presentation/theme/palette.dart';

class WebDashboardAppBar extends StatelessWidget {
  const WebDashboardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(SvgIcons.whiteLogo),
            Row(
              children: const <Widget>[
                _BellIcon(hasNotifications: true),
                SizedBox(width: 30),
                CircleAvatar(backgroundColor: Colors.green, radius: 20),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _BellIcon extends StatelessWidget {
  const _BellIcon({required this.hasNotifications, Key? key}) : super(key: key);

  final bool hasNotifications;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        SvgPicture.asset(SvgIcons.bell),
        if (hasNotifications)
          Container(
            margin: const EdgeInsets.all(1),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Palette.blue,
              shape: BoxShape.circle,
              border: Border.all(color: Palette.dirtyWhite),
            ),
          ),
      ],
    );
  }
}
