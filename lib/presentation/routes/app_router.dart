import 'package:auto_route/auto_route.dart';

import '../page/content_management_page/page.dart';
import '../page/dashboard_page/page.dart';
import '../page/main_page/page.dart';
import '../page/user_loyalty_and_rewards_page/user_loyalty_and_rewards_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        CustomRoute(
          initial: true,
          page: MainRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
          children: <AutoRoute>[
            CustomRoute(
              initial: true,
              path: 'dashboard',
              page: DashboardRoute.page,
              durationInMilliseconds: 0,
              reverseDurationInMilliseconds: 1,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              path: 'content-management',
              page: ContentManagementRoute.page,
              durationInMilliseconds: 0,
              reverseDurationInMilliseconds: 1,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              path: 'user-loyalty-and-rewards',
              page: UserLoyaltyAndRewardsRoute.page,
              durationInMilliseconds: 0,
              reverseDurationInMilliseconds: 1,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
          ],
        ),
      ];
}
