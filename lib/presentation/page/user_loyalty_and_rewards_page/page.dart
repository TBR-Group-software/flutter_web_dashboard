import 'package:flutter/material.dart';

import 'package:flutter_web_dashboard/presentation/page/user_loyalty_and_rewards_page/components/filter_dropdown.dart';
import 'package:flutter_web_dashboard/presentation/page/user_loyalty_and_rewards_page/components/search_field.dart';
import 'package:flutter_web_dashboard/presentation/theme/icons.dart';
import 'package:flutter_web_dashboard/presentation/theme/text_styles.dart';
import 'package:flutter_web_dashboard/presentation/widget/blue_buttond.dart';

class UserLoyaltyAndRewardsPage extends StatelessWidget {
  const UserLoyaltyAndRewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Text(
            'User Loyalty & Rewards',
            style: TextStyles.myriadProSemiBold32DarkBlue,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const FilterDropdown(),
            const Spacer(),
            const SearchField(),
            const SizedBox(width: 22),
            BlueButton(
              iconPath: SvgIcons.addRounded,
              onPressed: () {},
              title: 'Add User',
            ),
          ],
        ),
      ],
    );
  }
}
