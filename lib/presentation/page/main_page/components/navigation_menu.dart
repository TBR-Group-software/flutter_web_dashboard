part of '../page.dart';

class _NavigationMenu extends StatefulWidget {
  const _NavigationMenu();

  @override
  State<_NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<_NavigationMenu> {
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

  void _onTabTap(PageRouteInfo<dynamic> route) {
    context.pushRoute(route);
  }

  @override
  Widget build(BuildContext context) {
    final currentUrl = AutoRouterDelegate.of(context).urlState.path;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: ProjectAssets.icons.whiteLogo.svg(
              height: 14,
              width: 127,
              colorFilter: Palette.white.toColorFilter,
            ),
          ),
        ),
        const SizedBox(height: 40),
        _MenuItem(
          iconPath: ProjectAssets.icons.home.path,
          isSelected: currentUrl == '/dashboard',
          onTap: () => _onTabTap(const DashboardRoute()),
          text: 'Dashboard',
        ),
        _MenuItem(
          iconPath: ProjectAssets.icons.stack.path,
          isSelected: currentUrl == '/content-management',
          onTap: () => _onTabTap(const ContentManagementRoute()),
          text: 'Content Management',
        ),
        _MenuItem(
          iconPath: ProjectAssets.icons.cup.path,
          isSelected: currentUrl == '/user-loyalty-and-rewards',
          onTap: () => _onTabTap(const UserLoyaltyAndRewardsRoute()),
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
  });

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
                  colorFilter:
                      isSelected ? Palette.dirtyWhite.toColorFilter : null,
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
