import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../../data/rewards_data.dart';
import '../widgets/reward_item_card.dart';

class CityRewardsPage extends StatelessWidget {
  final String cityName;

  const CityRewardsPage({
    super.key,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    final rewards = RewardsData.getRewardsByCity(cityName);

    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              color: context.surface,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: context.primaryBlue),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    cityName,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: context.primaryBlue,
                    ),
                  ),
                ],
              ),
            ),
            // Lista de premios
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: rewards.length,
                itemBuilder: (context, index) {
                  final reward = rewards[index];
                  final isLight = index % 2 == 0;
                  
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: RewardItemCard(
                      name: reward.name,
                      price: reward.price,
                      isLight: isLight,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
