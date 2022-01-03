<p float = "center", align="center ">
     <img src="https://user-images.githubusercontent.com/86306159/147757875-b6460b62-27c9-4643-b719-c40621cb6d9f.png" width = "250" />
</p>

## About the project
The goal of the project is to show the capabilities of [Flutter Web](https://flutter.dev/multi-platform/web).

This is a dashboard that allows users to manage tasks, projects, files, view statistic and share them with their teammates based on the Flutter Web.

<p float="center", align="left ">
  <img src="https://user-images.githubusercontent.com/86306159/147759885-18954d33-7319-4143-a402-42fdc4f07b49.png" width="500" />

</p>

## Features
- Manage tasks.
- Projects.
- Files.
- View statistic with charts.
- Responsive design.




## Built with
- [Flutter Web](https://flutter.dev/multi-platform/web) - Easily reach more users in browsers with the same experience as on mobile devices through the power of Flutter on the web.
- [Visual Studio Code](https://code.visualstudio.com/) - Code Editing.
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) - To separate architecture into loosely coupled layers.
- [Auto Route](https://pub.dev/packages/auto_route) - Navigation of the application.
- [Fl Chart](https://pub.dev/packages/fl_chart) - Pie Chart and Vertical Bar Charts .
- [Syncfusion Flutter Charts](https://pub.dev/packages/syncfusion_flutter_charts) - Horizontal Bar Charts.



## Horizontal Bar Charts

![Снимок экрана 2021-12-30 в 16 32 17](https://user-images.githubusercontent.com/86306159/147760872-92822641-78f7-4ad6-a692-6a12af54596e.png)


```dart
SfCartesianChart(
        margin: EdgeInsets.zero,
        plotAreaBorderWidth: 0,
        title: ChartTitle(
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
        series: <ChartSeries>[
          _createBarSeries(femaleData),
          _createBarSeries(maleData),
        ],
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
```

## Vertical Bar Charts
![Снимок экрана 2021-12-30 в 16 35 20](https://user-images.githubusercontent.com/86306159/147761093-c620c5b3-2664-4d80-aa0d-51d13c2d104d.png)


```dart
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
```

## Getting Started


**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/TBR-Group-software/flutter_web_dashboard.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

## License
This project is licensed under the GNU GPL v3 License - see the [LICENSE.md](https://github.com/TBR-Group-software/flutter_web_dashboard/blob/main/LICENSE.md) file for details.
