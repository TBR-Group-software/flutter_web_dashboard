part of '../../page.dart';

class _DemographicsPage extends StatelessWidget {
  const _DemographicsPage();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 31, bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _CircleChart(femalePercent: 43.9, malePercent: 56.1),
          VerticalDivider(color: Palette.lightGrey),
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
  });

  final double malePercent;
  final double femalePercent;

  List<PieChartSectionData> generateSections(
    double malePercent,
    double femalePercent,
  ) {
    return [
      PieChartSectionData(
        color: Palette.lightBlue,
        value: malePercent,
        radius: 20,
        title: '',
      ),
      PieChartSectionData(
        color: Palette.orange,
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
                  style: TextStyles.myriadProSemiBold16DarkBlue,
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
                color: Palette.lightBlue,
                totalPercent: malePercent,
                growthPercent: 3.9,
              ),
              const SizedBox(width: 50),
              _CircleChartBottomInfo(
                text: 'Female',
                color: Palette.orange,
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
  });

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
              style: TextStyles.myriadProRegular13DarkBlue,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            const SizedBox(width: 20),
            Text(
              '$totalPercent%',
              style: TextStyles.myriadProSemiBold16DarkBlue,
            ),
            Icon(
              haveIncreased ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              size: 20,
              color: haveIncreased ? Palette.green : Palette.red,
            ),
            Text(
              '$growthPercent%',
              style: haveIncreased
                  ? TextStyles.myriadProSemiBold12Green
                  : TextStyles.myriadProSemiBold12Red,
            ),
          ],
        ),
      ],
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart();

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
        plotAreaBorderWidth: 0,
        title: const ChartTitle(
          text: 'Age',
          textStyle: TextStyles.myriadProSemiBold14DarkBlue,
          alignment: ChartAlignment.near,
        ),
        primaryXAxis: CategoryAxis(
          axisLabelFormatter: (AxisLabelRenderDetails details) {
            return ChartAxisLabel(
              details.text,
              TextStyles.myriadProRegular13DarkBlue.copyWith(
                color: Palette.darkBlue.withOpacity(0.6),
                fontSize: 12.8,
              ),
            );
          },
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
          majorGridLines: const MajorGridLines(width: 0),
          isVisible: true,
        ),
        primaryYAxis: NumericAxis(
          axisLabelFormatter: (AxisLabelRenderDetails details) {
            return ChartAxisLabel(
              '${details.text}%',
              TextStyles.myriadProRegular13DarkBlue.copyWith(
                fontSize: 12.8,
              ),
            );
          },
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0, width: 0),
          majorGridLines: const MajorGridLines(
            width: 0.5,
            color: Palette.lightGrey,
          ),
          minorTickLines: const MinorTickLines(size: 0, width: 0),
          minorGridLines: const MinorGridLines(width: 0),
          maximum: 15,
        ),
        palette: const <Color>[
          Palette.orange,
          Palette.lightBlue,
        ],
        series: <CartesianSeries>[
          _createBarSeries(femaleData),
          _createBarSeries(maleData),
        ],
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }
}
