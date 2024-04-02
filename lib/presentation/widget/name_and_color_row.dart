import 'package:flutter/material.dart';

import '../theme/text_styles.dart';

class NameAndColorRow extends StatelessWidget {
  const NameAndColorRow({
    required this.color,
    required this.text,
    super.key,
  });

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
      ],
    );
  }
}
