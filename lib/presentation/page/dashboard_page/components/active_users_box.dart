import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import 'package:flutter_web_dashboard/dummy_data/charts_data.dart';
import 'package:flutter_web_dashboard/presentation/theme/palette.dart';
import 'package:flutter_web_dashboard/presentation/theme/text_styles.dart';
import 'package:flutter_web_dashboard/presentation/widget/name_and_color_row.dart';

class ActiveUsersBox extends StatelessWidget {
  const ActiveUsersBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 558,
      height: 340,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 32.0, right: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Active Users',
                  style: TextStyles.myriadProSemiBold22DarkBlue,
                ),
                const SizedBox(height: 24),
                const _BarChart(),
                const SizedBox(height: 20),
                Row(
                  children: const <Widget>[
                    NameAndColorRow(color: Palette.lightBlue, text: 'Users'),
                    SizedBox(width: 36),
                    NameAndColorRow(
                        color: Palette.mediumBlue, text: 'New Users'),
                  ],
                ),
              ],
            ),
          ),
          const _DetailsColumn(
            daily: 23,
            monthly: 233,
            annual: 232323,
          ),
        ],
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 191, maxWidth: 366),
      child: BarChart(
        BarChartData(
          maxY: 500,
          alignment: BarChartAlignment.center,
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            rightTitles: SideTitles(showTitles: false),
            leftTitles: SideTitles(
              showTitles: true,
              getTextStyles: (_, __) => TextStyles.myriadProRegular13DarkBlue60,
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (_) => FlLine(
              color: Palette.mediumGrey40,
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              top: BorderSide(color: Palette.mediumGrey40, width: 1),
            ),
          ),
          barGroups: _chartData,
        ),
      ),
    );
  }

  static final List<BarChartGroupData> _chartData = [
    BarChartGroupData(
      x: 0,
      barsSpace: 20,
      barRods: [
        ...activeUsersData.entries
            .map(
              (MapEntry<int, List<double>> e) => BarChartRodData(
                y: e.value.first,
                width: 13,
                colors: [Palette.lightBlue],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  y: e.value.last,
                  colors: [Palette.mediumBlue],
                ),
              ),
            )
            .toList(),
      ],
    ),
  ];
}

class _DetailsColumn extends StatelessWidget {
  const _DetailsColumn({
    required this.annual,
    required this.monthly,
    required this.daily,
    Key? key,
  }) : super(key: key);

  final int annual;

  final int monthly;

  final int daily;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 301,
      decoration: BoxDecoration(
        color: Palette.mediumBlue50,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          _NumberAndTitle(
            title: 'Annual',
            number: 232323,
            numberTextStyle: TextStyles.myriadProSemiBold18Purple,
          ),
          Divider(color: Palette.mediumBlue),
          _NumberAndTitle(
            title: 'Mounthly',
            number: 233,
            numberTextStyle: TextStyles.myriadProSemiBold18Orange,
          ),
          Divider(color: Palette.mediumBlue),
          _NumberAndTitle(
            title: 'Daily',
            number: 23,
            numberTextStyle: TextStyles.myriadProSemiBold18LightBlue,
          ),
        ],
      ),
    );
  }
}

class _NumberAndTitle extends StatelessWidget {
  const _NumberAndTitle({
    required this.title,
    required this.number,
    required this.numberTextStyle,
    Key? key,
  }) : super(key: key);

  final String title;

  final int number;
  final TextStyle numberTextStyle;

  String _formatNumber(int number) {
    if (number.toString().length >= 10) {
      return NumberFormat.compact().format(number);
    } else {
      return NumberFormat.decimalPattern().format(number).replaceAll(',', ' ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(_formatNumber(number), style: numberTextStyle),
        const SizedBox(height: 7.6),
        Text(title, style: TextStyles.myriadProRegular13DarkGrey),
      ],
    );
  }
}
