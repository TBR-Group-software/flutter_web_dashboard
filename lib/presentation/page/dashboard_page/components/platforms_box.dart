import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_dashboard/presentation/theme/text_styles.dart';

class PlatformsBox extends StatelessWidget {
  const PlatformsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 268,
      height: 413,
      margin: const EdgeInsets.only(left: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          ScatterChartSample1(),
        ],
      ),
    );
  }
}

class ScatterChartSample1 extends StatefulWidget {
  const ScatterChartSample1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScatterChartSample1State();
}

class _ScatterChartSample1State extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SizedBox(
        width: 160,
        height: 150,
        child: Stack(
          children: const <Widget>[
            Positioned(
              bottom: 25,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green,
                child: Text(
                  '30',
                  style: TextStyles.myriadProSemiBold22White,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 50,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue,
                child: Text(
                  '10',
                  style: TextStyles.myriadProSemiBold22White,
                ),
              ),
            ),
            Positioned(
              left: 50,
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.red,
                child: Text(
                  '60',
                  style: TextStyles.myriadProSemiBold24White,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
