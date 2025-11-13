import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/theme_extensions.dart';

class FloatingChatButton extends StatelessWidget {
  final VoidCallback onTap;

  const FloatingChatButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: context.surface,
      elevation: 4,
      child: Icon(
        Iconsax.message,
        color: context.darkNavy,
        size: 28,
      ),
    );
  }
}
