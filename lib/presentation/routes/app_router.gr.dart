// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const MainPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    DashboardRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const DashboardPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 1,
          opaque: true,
          barrierDismissible: false);
    },
    ContentManagementRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const ContentManagementPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 1,
          opaque: true,
          barrierDismissible: false);
    },
    UserLoyaltyAndRewardsRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserLoyaltyAndRewardsPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 1,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(MainRoute.name, path: '/', children: [
          RouteConfig('#redirect',
              path: '',
              parent: MainRoute.name,
              redirectTo: 'dashboard',
              fullMatch: true),
          RouteConfig(DashboardRoute.name,
              path: 'dashboard', parent: MainRoute.name),
          RouteConfig(ContentManagementRoute.name,
              path: 'content-management', parent: MainRoute.name),
          RouteConfig(UserLoyaltyAndRewardsRoute.name,
              path: 'user-loyalty-and-rewards', parent: MainRoute.name)
        ])
      ];
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(MainRoute.name, path: '/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: 'dashboard');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [ContentManagementPage]
class ContentManagementRoute extends PageRouteInfo<void> {
  const ContentManagementRoute()
      : super(ContentManagementRoute.name, path: 'content-management');

  static const String name = 'ContentManagementRoute';
}

/// generated route for
/// [UserLoyaltyAndRewardsPage]
class UserLoyaltyAndRewardsRoute extends PageRouteInfo<void> {
  const UserLoyaltyAndRewardsRoute()
      : super(UserLoyaltyAndRewardsRoute.name,
            path: 'user-loyalty-and-rewards');

  static const String name = 'UserLoyaltyAndRewardsRoute';
}
