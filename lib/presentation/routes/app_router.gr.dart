// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ContentManagementRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContentManagementPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    UserLoyaltyAndRewardsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserLoyaltyAndRewardsPage(),
      );
    },
  };
}

/// generated route for
/// [ContentManagementPage]
class ContentManagementRoute extends PageRouteInfo<void> {
  const ContentManagementRoute({List<PageRouteInfo>? children})
      : super(
          ContentManagementRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContentManagementRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserLoyaltyAndRewardsPage]
class UserLoyaltyAndRewardsRoute extends PageRouteInfo<void> {
  const UserLoyaltyAndRewardsRoute({List<PageRouteInfo>? children})
      : super(
          UserLoyaltyAndRewardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserLoyaltyAndRewardsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
