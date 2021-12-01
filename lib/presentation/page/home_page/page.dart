import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/presentation/page/home_page/components/appbar.dart';
import 'package:flutter_web_dashboard/presentation/theme/palette.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 220,
              height: double.infinity,
              color: WebDashboardPalette.darkBlue,
            ),
            Expanded(
              child: Container(
                color: WebDashboardPalette.background,
              ),
            ),
          ],
        ),
        const WebDashBoardAppBar(),
      ],
    );
  }
}
