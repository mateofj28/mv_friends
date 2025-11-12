import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/referral_status_header.dart';
import '../widgets/referral_status_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ReferralStatusPage extends StatefulWidget {
  const ReferralStatusPage({super.key});

  @override
  State<ReferralStatusPage> createState() => _ReferralStatusPageState();
}

class _ReferralStatusPageState extends State<ReferralStatusPage> {
  String? _selectedFilter;

  @override
  Widget build(BuildContext context) {
    final allReferrals = [
      {
        'userName': 'Juan Pérez',
        'message': '¡Gracias por registrar a tu amigo!',
        'status': 'Sin Contactar',
        'color': const Color(0xFF004952),
        'progress': 0.2,
        'phone': '+57 300 123 4567',
        'email': 'juan.perez@email.com',
        'referralDate': '15/01/2024',
      },
      {
        'userName': 'María García',
        'message': '¡Nos estamos poniendo en contacto con tu amigo!',
        'status': 'Intentando Contactar',
        'color': const Color(0xFF2196F3),
        'progress': 0.4,
        'phone': '+57 301 234 5678',
        'email': 'maria.garcia@email.com',
        'referralDate': '20/01/2024',
      },
      {
        'userName': 'Carlos Rodríguez',
        'message': '¡Tu amigo ya cotizó su vivienda!',
        'status': 'Cotización',
        'color': const Color(0xFFFFA726),
        'progress': 0.6,
        'phone': '+57 302 345 6789',
        'email': 'carlos.rodriguez@email.com',
        'referralDate': '25/01/2024',
      },
      {
        'userName': 'Ana Martínez',
        'message': '¡Tu amigo está a un paso de convertirse en un Amigo Marval!',
        'status': 'Opcionado',
        'color': const Color(0xFF9C27B0),
        'progress': 0.8,
        'phone': '+57 303 456 7890',
        'email': 'ana.martinez@email.com',
        'referralDate': '28/01/2024',
      },
      {
        'userName': 'Luis Fernández',
        'message': '¡Felicidades, has ganado!',
        'status': 'Cerrado Ganado',
        'color': const Color(0xFF4CAF50),
        'progress': 1.0,
        'phone': '+57 304 567 8901',
        'email': 'luis.fernandez@email.com',
        'referralDate': '30/01/2024',
      },
      {
        'userName': 'Sofia López',
        'message': '¡Gracias por registrar a tu amigo!',
        'status': 'Sin Contactar',
        'color': const Color(0xFF004952),
        'progress': 0.2,
        'phone': '+57 305 678 9012',
        'email': 'sofia.lopez@email.com',
        'referralDate': '05/02/2024',
      },
      {
        'userName': 'Pedro Sánchez',
        'message': '¡Tu amigo ya cotizó su vivienda!',
        'status': 'Cotización',
        'color': const Color(0xFFFFA726),
        'progress': 0.6,
        'phone': '+57 306 789 0123',
        'email': 'pedro.sanchez@email.com',
        'referralDate': '10/02/2024',
      },
    ];

    // Filtrar referidos según el filtro seleccionado
    final filteredReferrals = _selectedFilter == null
        ? allReferrals
        : allReferrals.where((ref) => ref['status'] == _selectedFilter).toList();

    final filterOptions = [
      'Sin Contactar',
      'Intentando Contactar',
      'Cotización',
      'Opcionado',
      'Cerrado Ganado',
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const ReferralStatusHeader(),
            Expanded(
              child: ListView(
                children: [
                  // Filter Chips
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildFilterChip(
                            label: 'Todos',
                            isSelected: _selectedFilter == null,
                            onTap: () {
                              setState(() {
                                _selectedFilter = null;
                              });
                            },
                          ),
                          ...filterOptions.map((filter) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: _buildFilterChip(
                                label: filter,
                                isSelected: _selectedFilter == filter,
                                onTap: () {
                                  setState(() {
                                    _selectedFilter = filter;
                                  });
                                },
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  // Referral Cards
                  if (filteredReferrals.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              Iconsax.search_normal,
                              size: 64,
                              color: AppColors.textSecondary.withValues(alpha: 0.5),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No hay referidos con este estado',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: filteredReferrals.map((referral) {
                          return ReferralStatusCard(
                            userName: referral['userName'] as String,
                            message: referral['message'] as String,
                            status: referral['status'] as String,
                            statusColor: referral['color'] as Color,
                            progress: referral['progress'] as double,
                            phone: referral['phone'] as String?,
                            email: referral['email'] as String?,
                            referralDate: referral['referralDate'] as String?,
                          );
                        }).toList(),
                      ),
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : AppColors.background,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
