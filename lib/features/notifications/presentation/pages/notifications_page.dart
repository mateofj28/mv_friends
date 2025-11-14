import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/theme_extensions.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Map<String, dynamic>> notifications = [
    {
      'title': 'Nuevo referido registrado',
      'message': 'Juan Pérez se ha registrado usando tu código',
      'time': 'Hace 2 horas',
      'icon': Iconsax.user_add,
      'isRead': false,
    },
    {
      'title': 'Cupón generado',
      'message': 'Tu cupón de \$50.000 está listo para usar',
      'time': 'Hace 5 horas',
      'icon': Iconsax.ticket,
      'isRead': false,
    },
    {
      'title': '¡Felicitaciones!',
      'message': 'Has alcanzado el nivel Oro',
      'time': 'Hace 1 día',
      'icon': Iconsax.medal_star,
      'isRead': true,
    },
    {
      'title': 'Nuevo premio disponible',
      'message': 'Revisa los nuevos premios en el catálogo',
      'time': 'Hace 2 días',
      'icon': Iconsax.gift,
      'isRead': true,
    },
  ];

  void _markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification['isRead'] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: _buildNotificationsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: context.surface,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: context.primaryBlue),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(width: 8),
              Text(
                'Notificaciones',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: context.primaryBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: _markAllAsRead,
              icon: const Icon(
                Iconsax.tick_circle,
                size: 18,
              ),
              label: Text(
                'Marcar todas como leídas',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: context.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsList() {

    if (notifications.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.notification_bing,
              size: 80,
              color: context.textLight,
            ),
            const SizedBox(height: 16),
            Text(
              'No tienes notificaciones',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: context.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return _buildNotificationItem(
          title: notification['title'] as String,
          message: notification['message'] as String,
          time: notification['time'] as String,
          icon: notification['icon'] as IconData,
          isRead: notification['isRead'] as bool,
        );
      },
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String message,
    required String time,
    required IconData icon,
    required bool isRead,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isRead ? context.surface : context.primaryBlue.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isRead ? context.background : context.primaryBlue.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: context.primaryBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: context.primaryBlue,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: context.darkNavy,
                        ),
                      ),
                    ),
                    if (!isRead)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: context.primaryBlue,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: context.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: context.textLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
