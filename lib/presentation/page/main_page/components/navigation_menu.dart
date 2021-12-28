import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_dashboard/presentation/routes/app_router.dart';

import 'package:flutter_web_dashboard/presentation/theme/icons.dart';
import 'package:flutter_web_dashboard/presentation/theme/palette.dart';
import 'package:flutter_web_dashboard/presentation/theme/text_styles.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  bool _isListenerAdded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isListenerAdded) {
      AutoRouterDelegate.of(context).addListener(() {
        if (mounted) setState(() {});
      });
      _isListenerAdded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentUrl = AutoRouterDelegate.of(context).urlState.path;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 120),
        _MenuItem(
          iconPath: SvgIcons.home,
          isSelected: currentUrl == '/${const DashboardRoute().path}',
          onTap: () {
            context.navigateTo(
              const MainRoute(children: [DashboardRoute()]),
            );
          },
          text: 'Dashboard',
        ),
        _MenuItem(
          iconPath: SvgIcons.stack,
          isSelected: currentUrl == '/${const ContentManagementRoute().path}',
          onTap: () {
            context.navigateTo(
              const MainRoute(children: [ContentManagementRoute()]),
            );
          },
          text: 'Content Management',
        ),
        _MenuItem(
          iconPath: SvgIcons.cup,
          isSelected:
              currentUrl == '/${const UserLoyaltyAndRewardsRoute().path}',
          onTap: () {
            context.navigateTo(
              const MainRoute(children: [UserLoyaltyAndRewardsRoute()]),
            );
          },
          text: 'User Loyalty & Rewards',
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.iconPath,
    required this.text,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String iconPath;

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
                  color: Palette.lightBlue,
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
                SvgPicture.asset(
                  iconPath,
                  width: 16,
                  height: 16,
                  color: isSelected ? Palette.dirtyWhite : null,
                ),
                const SizedBox(width: 8),
                Text(
                  text,
                  style: isSelected
                      ? TextStyles.myriadProSemiBold12DirtyWhite
                      : TextStyles.myriadProSemiBold12DirtyWhite.copyWith(
                          color: Palette.dirtyWhite.withOpacity(0.8),
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
