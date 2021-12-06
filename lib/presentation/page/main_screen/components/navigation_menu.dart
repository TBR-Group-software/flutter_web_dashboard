import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_web_dashboard/presentation/theme/icons.dart';
import 'package:flutter_web_dashboard/presentation/theme/palette.dart';
import 'package:flutter_web_dashboard/presentation/theme/text_styles.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 120),
        _MenuItem(
          activeIcon: SvgPicture.asset(WebDashboardIcons.homeWhite),
          inactiveIcon: SvgPicture.asset(WebDashboardIcons.homeGrey),
          isSelected: selectedIndex == 0,
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          text: 'Dashboard',
        ),
        _MenuItem(
          activeIcon: SvgPicture.asset(WebDashboardIcons.stackWhite),
          inactiveIcon: SvgPicture.asset(WebDashboardIcons.stackGrey),
          isSelected: selectedIndex == 1,
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          text: 'Content Management',
        ),
        _MenuItem(
          activeIcon: SvgPicture.asset(WebDashboardIcons.cupWhite),
          inactiveIcon: SvgPicture.asset(WebDashboardIcons.cupGrey),
          isSelected: selectedIndex == 2,
          onTap: () {
            setState(() {
              selectedIndex = 2;
            });
          },
          text: 'User Loyalty & Rewards',
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.text,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Widget inactiveIcon;
  final Widget activeIcon;

  final String text;

  final void Function() onTap;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 205,
          height: 42,
          margin: const EdgeInsets.only(bottom: 25),
          decoration: isSelected
              ? const BoxDecoration(
                  color: WebDashboardPalette.lightBlue,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                )
              : null,
          child: Padding(
            padding: const EdgeInsets.only(left: 43.0),
            child: Row(
              children: <Widget>[
                if (isSelected) activeIcon else inactiveIcon,
                const SizedBox(width: 8),
                Text(
                  text,
                  style: isSelected
                      ? WebDashboardTextStyles.myriadProSemiBold12DirtyWhite
                      : WebDashboardTextStyles.myriadProSemiBold12DirtyWhite
                          .copyWith(
                          color:
                              WebDashboardPalette.dirtyWhite.withOpacity(0.8),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
