import 'package:flutter/material.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../../../../core/utils/navigation_helper.dart';
import '../widgets/rewards_header.dart';
import '../widgets/wallet_balance.dart';
import '../widgets/tier_requirements.dart';
import '../widgets/transaction_history.dart';
import '../widgets/redeem_button.dart';
import '../../../rewards_redeem/presentation/pages/rewards_redeem_page.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Column(
          children: [
            const RewardsHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const WalletBalance(
                      amount: '\$500,000',
                      currency: 'COP',
                    ),
                    const TierRequirements(),
                    const SizedBox(height: 20),
                    const TransactionHistory(),
                    RedeemButton(
                      onPressed: () {
                        NavigationHelper.navigateWithSlideAnimation(
                          context,
                          const RewardsRedeemPage(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

