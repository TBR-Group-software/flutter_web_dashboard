import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_web_dashboard/presentation/theme/palette.dart';
import 'package:flutter_web_dashboard/presentation/theme/text_styles.dart';

class InformationBox extends StatelessWidget {
  const InformationBox({
    required this.icon,
    required this.backgroundColor,
    required this.number,
    required this.percent,
    required this.text,
    required this.haveIncreased,
    this.showPercent = false,
    Key? key,
  }) : super(key: key);

  final Widget icon;
  final Color backgroundColor;

  final int number;

  final bool showPercent;

  final double percent;

  final bool haveIncreased;

  final String text;

  String _formatNumber(int number) {
    if (number.toString().length >= 10) {
      return NumberFormat.compact().format(number);
    } else {
      return NumberFormat.decimalPattern().format(number).replaceAll(',', ' ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 268,
      height: 163,
      padding: const EdgeInsets.only(top: 22, bottom: 22),
      margin: const EdgeInsets.only(right: 22, bottom: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 24,
            backgroundColor: backgroundColor,
            child: icon,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                showPercent ? number.toString() + '%' : _formatNumber(number),
                style: WebDashboardTextStyles.myriadProSemiBold24Dark,
              ),
              const SizedBox(width: 5),
              Icon(
                haveIncreased ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                size: 20,
                color: haveIncreased
                    ? WebDashboardPalette.green
                    : WebDashboardPalette.red,
              ),
              Text(
                percent.toString() + '%',
                style: haveIncreased
                    ? WebDashboardTextStyles.myriadProSemiBold12Green
                    : WebDashboardTextStyles.myriadProSemiBold12Red,
              ),
            ],
          ),
          const SizedBox(height: 7),
          Text(text, style: WebDashboardTextStyles.myriadProRegular16DarkGrey),
        ],
      ),
    );
  }
}
