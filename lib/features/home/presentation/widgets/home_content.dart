import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/utils/navigation_helper.dart';
import '../widgets/user_profile_card.dart';
import '../widgets/menu_card.dart';
import '../../../referral/presentation/pages/referral_page.dart';
import '../../../referral_status/presentation/pages/referral_status_page.dart';
import '../../../rewards/presentation/pages/rewards_page.dart';
import '../../../rewards_plan/presentation/pages/rewards_plan_page.dart';

class HomeContent extends StatelessWidget {
  final VoidCallback onProfileTap;

  const HomeContent({
    super.key,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserProfileCard(onTap: onProfileTap),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                MenuCard(
                  icon: Iconsax.user_add,
                  title: 'Referir',
                  subtitle: 'Referir un amigo',
                  onTap: () => NavigationHelper.navigateWithSlideAnimation(
                    context,
                    const ReferralPage(),
                  ),
                ),
                MenuCard(
                  icon: Iconsax.chart,
                  title: 'Estado de mis referidos',
                  subtitle: 'Ver estado de referidos',
                  onTap: () => NavigationHelper.navigateWithSlideAnimation(
                    context,
                    const ReferralStatusPage(),
                  ),
                ),
                MenuCard(
                  icon: Iconsax.gift,
                  title: 'Redimir premios',
                  subtitle: 'Canjear tus premios',
                  onTap: () => NavigationHelper.navigateWithSlideAnimation(
                    context,
                    const RewardsPage(),
                  ),
                ),
                MenuCard(
                  icon: Iconsax.cup,
                  title: 'Plan de premios',
                  subtitle: 'Ver premios disponibles',
                  onTap: () => NavigationHelper.navigateWithSlideAnimation(
                    context,
                    const RewardsPlanPage(),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
