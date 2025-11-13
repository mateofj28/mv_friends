import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/theme_extensions.dart';

class StatusTimeline extends StatelessWidget {
  final int currentStep;

  const StatusTimeline({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    final steps = [
      {'label': 'Sin\ncontactar', 'step': 1},
      {'label': 'Intentando\ncontactar', 'step': 2},
      {'label': 'Cotizando', 'step': 3},
      {'label': 'Opcionado', 'step': 4},
      {'label': 'Cerrado\nGanado', 'step': 5},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            steps[currentStep - 1]['label'] as String,
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: context.darkNavy,
            ),
          ),
          const SizedBox(height: 40),
          // Timeline completo en una sola fila
          _buildTimelineRow(steps, currentStep, context),
        ],
      ),
    );
  }

  Widget _buildTimelineRow(List<Map<String, dynamic>> steps, int currentStep, BuildContext context) {
    return Column(
      children: List.generate(
        steps.length,
        (index) {
          final step = steps[index];
          final stepNumber = step['step'] as int;
          final isActive = currentStep == stepNumber;
          final isCompleted = currentStep > stepNumber;
          final isPending = currentStep < stepNumber;
          final isLast = index == steps.length - 1;

          return Column(
            children: [
              Row(
                children: [
                  // Círculo de paso
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive
                          ? context.primaryCyan
                          : isCompleted
                              ? context.primaryBlue
                              : context.surface,
                      border: Border.all(
                        color: isPending
                            ? context.textLight
                            : isActive
                                ? context.primaryCyan
                                : context.primaryBlue,
                        width: 3,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        stepNumber.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: isActive || isCompleted
                              ? context.textWhite
                              : context.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Label
                  Expanded(
                    child: Text(
                      (step['label'] as String).replaceAll('\n', ' '),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                        color: isActive
                            ? context.darkNavy
                            : isPending
                                ? context.textSecondary
                                : context.primaryBlue,
                      ),
                    ),
                  ),
                ],
              ),
              if (!isLast)
                Padding(
                  padding: const EdgeInsets.only(left: 29, top: 8, bottom: 8),
                  child: Container(
                    width: 3,
                    height: 40,
                    color: isCompleted
                        ? context.primaryBlue
                        : context.textLight,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
