import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_web_dashboard/presentation/theme/icons.dart';
import 'package:flutter_web_dashboard/presentation/theme/palette.dart';
import 'package:flutter_web_dashboard/presentation/theme/text_styles.dart';

class FilterDropdown extends StatefulWidget {
  const FilterDropdown({Key? key}) : super(key: key);

  @override
  State<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  double turns = 0;

  double containerHeight = 46;

  void showDropdownMenu(BuildContext context) {
    final NavigatorState navigator = Navigator.of(context);

    navigator.push(CustomRoute()).then((_) {
      setState(() {
        turns = 0;
        containerHeight = 46;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDropdownMenu(context);
        setState(() {
          turns = -1 / 2;
          containerHeight = 60;
        });
      },
      child: Container(
        width: 234,
        height: containerHeight,
        padding: const EdgeInsets.only(left: 16, right: 19, top: 14),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Palette.mediumGrey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Filter', style: TextStyles.myriadProRegular16DarkGrey),
            AnimatedRotation(
              turns: turns,
              duration: const Duration(milliseconds: 300),
              child: SvgPicture.asset(SvgIcons.arrowDown),
            ),
          ],
        ),
      ),
    );
  }
}

class _DropdownMenu extends StatelessWidget {
  const _DropdownMenu({required this.animation, Key? key}) : super(key: key);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return CustomSingleChildLayout(
      delegate: const _DropdownMenuLayout(width: 234, height: 212),
      child: ScaleTransition(
        alignment: Alignment.topCenter,
        scale: CurvedAnimation(
          parent: animation,
          curve: const Interval(0.0, 0.25),
          reverseCurve: const Interval(0.75, 1.0),
        ),
        child: const SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              border: Border.fromBorderSide(
                BorderSide(color: Palette.mediumGrey),
              ),
            ),
            child: _DropdownMenuItems(),
          ),
        ),
      ),
    );
  }
}

class _DropdownMenuItems extends StatelessWidget {
  const _DropdownMenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        _DropdownMenuItem(text: 'Membership Type'),
        _DropdownMenuItem(text: 'Loyalty Points'),
        _DropdownMenuItem(text: 'Rewards Points'),
        _DropdownMenuItem(text: 'Last Active'),
      ],
    );
  }
}

class _DropdownMenuItem extends StatefulWidget {
  const _DropdownMenuItem({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  State<_DropdownMenuItem> createState() => _DropdownMenuItemState();
}

class _DropdownMenuItemState extends State<_DropdownMenuItem> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() => selected = !selected);
      },
      child: Container(
        height: 53,
        padding: const EdgeInsets.only(left: 19, right: 15),
        color: selected ? Palette.lightBlue : Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              widget.text,
              style: selected
                  ? TextStyles.myriadProSemiBold16White
                  : TextStyles.myriadProRegular16DarkGrey,
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: selected ? Colors.white : Palette.darkGrey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRoute extends PopupRoute {
  CustomRoute();

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  final String? barrierLabel = null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) =>
      _DropdownMenu(animation: animation);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}

class _DropdownMenuLayout extends SingleChildLayoutDelegate {
  const _DropdownMenuLayout({
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Size getSize(BoxConstraints constraints) => constraints.biggest;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) =>
      BoxConstraints(maxHeight: height, maxWidth: width);

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return const Offset(40, 160);
  }

  @override
  bool shouldRelayout(covariant _DropdownMenuLayout oldDelegate) {
    return height != oldDelegate.height || width != oldDelegate.width;
  }
}
