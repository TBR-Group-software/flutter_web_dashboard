import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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

  final Color dark = const Color(0xff3b8c75);
  final Color normal = const Color(0xff64caad);
  final Color light = const Color(0xff73e8c9);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Container(
        color: Colors.red,
        width: 200,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceBetween,
              barTouchData: BarTouchData(
                enabled: false,
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  textDirection: TextDirection.ltr,
                  rotateAngle: 270,
                  showTitles: true,
                  getTextStyles: (context, value) =>
                      const TextStyle(color: Color(0xff939393), fontSize: 10),
                  margin: 10,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return '18 - 24';
                      case 1:
                        return '25 - 34';
                      case 2:
                        return '35 - 44';
                      case 3:
                        return '44 - 56';
                      case 4:
                        return '56+';
                      default:
                        return '';
                    }
                  },
                ),
                rightTitles: SideTitles(
                  getTitles: (double value) {
                    print(value);
                    switch (value.toInt()) {
                      case 0:
                        return '0%';
                      case 5:
                        return '5%';
                      case 10:
                        return '10%';
                      case 15:
                        return '15%';
                      default:
                        return '';
                    }
                  },
                  rotateAngle: 270,
                  showTitles: true,
                  reservedSize: 40,
                  getTextStyles: (context, value) => const TextStyle(
                    color: Color(0xff939393),
                    fontSize: 10,
                  ),
                  margin: 0,
                ),
                topTitles: SideTitles(showTitles: false),
                leftTitles: SideTitles(showTitles: false),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowVerticalLine: (value) => true,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: const Color(0xffe7e8ec),
                  strokeWidth: 1,
                ),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              groupsSpace: 4,
              barGroups: getData(),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            width: 13,
            y: 9,
            rodStackItems: [
              BarChartRodStackItem(0, 9, Colors.blue),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          BarChartRodData(
            width: 13,
            y: 15,
            rodStackItems: [
              BarChartRodStackItem(0, 32000000000, Colors.orange),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            width: 13,
            y: 15,
            rodStackItems: [
              BarChartRodStackItem(0, 29000000000, Colors.blue),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          BarChartRodData(
            width: 13,
            y: 15,
            rodStackItems: [
              BarChartRodStackItem(0, 32000000000, Colors.orange),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            width: 13,
            y: 15,
            rodStackItems: [
              BarChartRodStackItem(0, 29000000000, Colors.blue),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          BarChartRodData(
            width: 13,
            y: 15,
            rodStackItems: [
              BarChartRodStackItem(0, 32000000000, Colors.orange),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            width: 13,
            y: 15,
            rodStackItems: [
              BarChartRodStackItem(0, 29000000000, Colors.blue),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          BarChartRodData(
            width: 13,
            y: 15,
            rodStackItems: [
              BarChartRodStackItem(0, 32000000000, Colors.orange),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            width: 13,
            y: 15,
            rodStackItems: [
              BarChartRodStackItem(0, 29000000000, Colors.blue),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          BarChartRodData(
            width: 13,
            y: 15,
            rodStackItems: [
              BarChartRodStackItem(0, 32000000000, Colors.orange),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      ),
    ];
  }
}
