import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/presentation/page/content_management_page/page.dart';
import 'package:flutter_web_dashboard/presentation/page/dashboard_page/page.dart';
import 'package:flutter_web_dashboard/presentation/page/main_page/page.dart';
import 'package:flutter_web_dashboard/presentation/page/user_loyalty_and_rewards_page/user_loyalty_and_rewards_page.dart';

part 'app_router.gr.dart';

const String renamePageToRoute = 'Page,Route';

@MaterialAutoRouter(
  replaceInRouteName: renamePageToRoute,
  routes: <AutoRoute>[
    CustomRoute(
      initial: true,
      page: MainPage,
      transitionsBuilder: TransitionsBuilders.noTransition,
      children: <AutoRoute>[
        CustomRoute(
          initial: true,
          path: 'dashboard',
          page: DashboardPage,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 1,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          path: 'content-management',
          page: ContentManagementPage,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 1,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          path: 'user-loyalty-and-rewards',
          page: UserLoyaltyAndRewardsPage,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 1,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
