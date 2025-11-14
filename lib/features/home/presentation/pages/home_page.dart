import 'package:flutter/material.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../widgets/home_header.dart';
import '../widgets/home_content.dart';
import '../widgets/floating_chat_button.dart';
import '../../../profile/presentation/widgets/profile_content.dart';
import '../../../chatbot/presentation/pages/chatbot_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onChatTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ChatbotPage(),
      ),
    );
  }

  void _navigateToProfile() {
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _navigateToHome() {
    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            HomeHeader(onLogoTap: _navigateToHome),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  HomeContent(onProfileTap: _navigateToProfile),
                  const ProfileContent(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingChatButton(
        onTap: _onChatTap,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
