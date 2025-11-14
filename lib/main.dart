import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'core/di/injection.dart';
import 'features/referral/data/providers/referral_provider.dart';

export 'core/theme/theme_provider.dart' show AppThemeMode;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  setupDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ReferralProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return MaterialApp.router(
      title: 'Marval Friends',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode == AppThemeMode.light
          ? ThemeMode.light
          : themeProvider.themeMode == AppThemeMode.dark
              ? ThemeMode.dark
              : ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
