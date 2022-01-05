import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_web_dashboard/presentation/theme/icons.dart';
import 'package:flutter_web_dashboard/presentation/theme/palette.dart';
import 'package:flutter_web_dashboard/presentation/theme/text_styles.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 44,
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Palette.mediumGrey),
      ),
      child: TextField(
        controller: _controller,
        cursorHeight: 12,
        style: TextStyles.myriadProRegular16DarkGrey,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
            },
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(SvgIcons.search),
          ),
          hintText: 'Search',
          hintStyle: TextStyles.myriadProRegular16DarkGrey,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
