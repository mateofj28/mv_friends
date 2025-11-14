import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../../../notifications/presentation/pages/notifications_page.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback? onLogoTap;

  const HomeHeader({
    super.key,
    this.onLogoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: context.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onLogoTap,
            child: Image.asset(
              'assets/images/logo.png',
              height: 48,
            ),
          ),
          // Notification icon
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationsPage(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Iconsax.notification,
                color: context.primaryBlue,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
