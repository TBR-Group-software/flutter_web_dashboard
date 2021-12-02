import 'package:flutter/material.dart';

import 'package:flutter_web_dashboard/presentation/theme/palette.dart';
import 'package:flutter_web_dashboard/presentation/theme/text_styles.dart';

class StatisticsBox extends StatelessWidget {
  const StatisticsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 848,
      height: 413,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32.0, left: 32.0),
            child: Text(
              'Statistics',
              style: WebDashboardTextStyles.myriadProSemiBold22DarkBlue,
            ),
          ),
          SizedBox(height: 26),
          _StatisticsTabs(),
        ],
      ),
    );
  }
}

class _StatisticsTabs extends StatefulWidget {
  const _StatisticsTabs({Key? key}) : super(key: key);

  @override
  _StatisticsTabsState createState() => _StatisticsTabsState();
}

class _StatisticsTabsState extends State<_StatisticsTabs>
    with TickerProviderStateMixin {
  late final TabController _controller;

  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 3,
      vsync: this,
      initialIndex: selectedIndex,
    );
    _controller.addListener(() {
      setState(() {
        selectedIndex = _controller.index;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.bottomCenter,
            child: Divider(color: WebDashboardPalette.lightGrey),
          ),
          TabBar(
            padding: const EdgeInsets.only(left: 20),
            isScrollable: true,
            controller: _controller,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              _StatisticsTab(isSelected: selectedIndex == 0, text: 'Location'),
              _StatisticsTab(
                isSelected: selectedIndex == 1,
                text: 'Demographics',
              ),
              _StatisticsTab(isSelected: selectedIndex == 2, text: 'Interests'),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatisticsTab extends StatelessWidget {
  const _StatisticsTab({
    required this.text,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final bool isSelected;

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Text(
        text,
        style: isSelected
            ? WebDashboardTextStyles.myriadProSemiBold14LightBlue
            : WebDashboardTextStyles.myriadProSemiBold14DarkBlue.copyWith(
                color: WebDashboardPalette.darkBlue.withOpacity(0.4),
              ),
      ),
    );
  }
}
