import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/models/referral_detail.dart';
import '../widgets/referral_detail_header.dart';
import '../widgets/referral_user_header.dart';
import '../widgets/status_timeline.dart';

class ReferralDetailPage extends StatelessWidget {
  final ReferralDetail referral;

  const ReferralDetailPage({
    super.key,
    required this.referral,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const ReferralDetailHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ReferralUserHeader(
                      userName: referral.userName,
                      phone: referral.phone,
                      email: referral.email,
                      referralDate: referral.referralDate,
                    ),
                    StatusTimeline(
                      currentStep: referral.currentStep,
                    ),
                    const SizedBox(height: 20),
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
