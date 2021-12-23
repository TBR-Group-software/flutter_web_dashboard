import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter_web_dashboard/dummy_data/age_chart_data.dart';
import 'package:flutter_web_dashboard/presentation/theme/palette.dart';
import 'package:flutter_web_dashboard/presentation/theme/text_styles.dart';

class DemographicsPage extends StatelessWidget {
  const DemographicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 31, bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          _CircleChart(femalePercent: 43.9, malePercent: 56.1),
          VerticalDivider(color: WebDashboardPalette.lightGrey),
          _BarChart(),
        ],
      ),
    );
  }
}

class _CircleChart extends StatelessWidget {
  const _CircleChart({
    required this.malePercent,
    required this.femalePercent,
    Key? key,
  }) : super(key: key);

  final double malePercent;
  final double femalePercent;

  List<PieChartSectionData> generateSections(
    double malePercent,
    double femalePercent,
  ) {
    return [
      PieChartSectionData(
        color: WebDashboardPalette.lightBlue,
        value: malePercent,
        radius: 20,
        title: '',
      ),
      PieChartSectionData(
        color: WebDashboardPalette.orange,
        value: femalePercent,
        radius: 20,
        title: '',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 31, right: 47),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 160,
            height: 160,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                PieChart(
                  PieChartData(
                    startDegreeOffset: 270,
                    sectionsSpace: 0,
                    centerSpaceRadius: 60,
                    sections: generateSections(
                      malePercent,
                      femalePercent,
                    ),
                  ),
                ),
                const Text(
                  'Gender',
                  style: WebDashboardTextStyles.myriadProSemiBold16DarkBlue,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _CircleChartBottomInfo(
                text: 'Male',
                color: WebDashboardPalette.lightBlue,
                totalPercent: malePercent,
                growthPercent: 3.9,
              ),
              const SizedBox(width: 50),
              _CircleChartBottomInfo(
                text: 'Female',
                color: WebDashboardPalette.orange,
                totalPercent: femalePercent,
                growthPercent: 38.9,
                haveIncreased: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CircleChartBottomInfo extends StatelessWidget {
  const _CircleChartBottomInfo({
    required this.text,
    required this.color,
    required this.growthPercent,
    required this.totalPercent,
    this.haveIncreased = true,
    Key? key,
  }) : super(key: key);

  final String text;

  final Color color;

  final double totalPercent;
  final double growthPercent;

  final bool haveIncreased;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(backgroundColor: color, radius: 5),
            const SizedBox(width: 8),
            Text(
              text,
              style: WebDashboardTextStyles.myriadProRegular13DarkBlue,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            const SizedBox(width: 20),
            Text(
              totalPercent.toString() + '%',
              style: WebDashboardTextStyles.myriadProSemiBold16DarkBlue,
            ),
            Icon(
              haveIncreased ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              size: 20,
              color: haveIncreased
                  ? WebDashboardPalette.green
                  : WebDashboardPalette.red,
            ),
            Text(
              growthPercent.toString() + '%',
              style: haveIncreased
                  ? WebDashboardTextStyles.myriadProSemiBold12Green
                  : WebDashboardTextStyles.myriadProSemiBold12Red,
            ),
          ],
        ),
      ],
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart({Key? key}) : super(key: key);

  BarSeries<UsersAgeData, String> _createBarSeries(
    List<UsersAgeData> dataSource,
  ) {
    return BarSeries<UsersAgeData, String>(
      spacing: 0.25,
      width: 0.9,
      trackBorderWidth: 0,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(4),
        bottomRight: Radius.circular(4),
      ),
      enableTooltip: false,
      dataSource: dataSource,
      xValueMapper: (UsersAgeData data, _) => data.age,
      yValueMapper: (UsersAgeData data, _) => data.percent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 63),
      child: SfCartesianChart(
        margin: EdgeInsets.zero,
        axisLabelFormatter: (AxisLabelRenderDetails details) {
          if (details.axis is NumericAxis) {
            return ChartAxisLabel(
              '${details.text}%',
              WebDashboardTextStyles.myriadProRegular13DarkBlue.copyWith(
                fontSize: 12.8,
              ),
            );
          }
          return ChartAxisLabel(
            details.text,
            WebDashboardTextStyles.myriadProRegular13DarkBlue.copyWith(
              color: WebDashboardPalette.darkBlue.withOpacity(0.6),
              fontSize: 12.8,
            ),
          );
        },
        plotAreaBorderWidth: 0,
        title: ChartTitle(
          text: 'Age',
          textStyle: WebDashboardTextStyles.myriadProSemiBold14DarkBlue,
          alignment: ChartAlignment.near,
        ),
        primaryXAxis: CategoryAxis(
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
          majorGridLines: const MajorGridLines(width: 0),
          isVisible: true,
        ),
        primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0, width: 0),
          majorGridLines: const MajorGridLines(
            width: 0.5,
            color: WebDashboardPalette.lightGrey,
          ),
          minorTickLines: const MinorTickLines(size: 0, width: 0),
          minorGridLines: const MinorGridLines(width: 0),
          maximum: 15,
        ),
        palette: const <Color>[
          WebDashboardPalette.orange,
          WebDashboardPalette.lightBlue,
        ],
        series: <ChartSeries>[
          _createBarSeries(femaleData),
          _createBarSeries(maleData),
        ],
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }
}
