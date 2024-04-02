import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserLoyaltyAndRewardsPage extends StatelessWidget {
  const UserLoyaltyAndRewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 26, horizontal: 40),
      child: Text('UserLoyaltyAndRewardsPage'),
    );
  }
}
