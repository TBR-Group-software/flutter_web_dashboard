import 'package:flutter/material.dart';

import 'package:flutter_web_dashboard/presentation/theme/text_styles.dart';

class NameAndColorRow extends StatelessWidget {
  const NameAndColorRow({
    required this.color,
    required this.text,
    Key? key,
  }) : super(key: key);

  final Color color;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircleAvatar(radius: 5, backgroundColor: color),
        const SizedBox(width: 8),
        Text(text, style: TextStyles.myriadProRegular13DarkBlue),
        const SizedBox(width: 36),
      ],
    );
  }
}
