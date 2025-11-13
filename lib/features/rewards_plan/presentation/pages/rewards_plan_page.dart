import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../../../../core/utils/navigation_helper.dart';
import 'city_rewards_page.dart';

class RewardsPlanPage extends StatefulWidget {
  const RewardsPlanPage({super.key});

  @override
  State<RewardsPlanPage> createState() => _RewardsPlanPageState();
}

class _RewardsPlanPageState extends State<RewardsPlanPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cities = [
      {'name': 'Bucaramanga', 'image': 'assets/images/cities/bucaramanga.jpg'},
      {'name': 'Bogotá', 'image': 'assets/images/cities/bogota.jpg'},
      {'name': 'Cartagena', 'image': 'assets/images/cities/cartagena.webp'},
      {
        'name': 'Barranquilla',
        'image': 'assets/images/cities/barranquilla.jpg'
      },
      {'name': 'Cali', 'image': 'assets/images/cities/cali.jpg'},
    ];

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
                    'Plan de premios',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: context.primaryBlue,
                    ),
                  ),
                ],
              ),
            ),
            // Lista de ciudades
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    final city = cities[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: InkWell(
                        onTap: () {
                          NavigationHelper.navigateWithSlideAnimation(
                            context,
                            CityRewardsPage(cityName: city['name'] as String),
                          );
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.15),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                // Imagen de fondo
                                Positioned.fill(
                                  child: Image.asset(
                                    city['image'] as String,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // Overlay oscuro para mejorar legibilidad
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(alpha: 0.35),
                                    ),
                                  ),
                                ),
                                // Texto
                                Center(
                                  child: Text(
                                    city['name'] as String,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      letterSpacing: 0.5,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black45,
                                          offset: Offset(0, 2),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Carrusel de publicidad
            Container(
              height: 180,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.surface,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: context.background,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_outlined,
                                    size: 48,
                                    color: context.textLight,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Publicidad ${index + 1}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: context.textSecondary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Indicadores de página
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? context.primaryBlue
                              : context.textLight,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
