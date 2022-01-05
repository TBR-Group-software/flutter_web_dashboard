import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_web_dashboard/presentation/theme/palette.dart';
import 'package:flutter_web_dashboard/presentation/theme/text_styles.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({
    required this.iconPath,
    required this.title,
    this.width = 153,
    this.height = 44,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;

  final String iconPath;
  final String title;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(iconPath),
      label: Text(title, style: TextStyles.myriadProSemiBold16DirtyWhite),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Palette.lightBlue),
        fixedSize: MaterialStateProperty.all<Size>(Size(width, height)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}
