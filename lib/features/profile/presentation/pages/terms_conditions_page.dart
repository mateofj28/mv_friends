import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.white,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.primaryBlue),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Términos y condiciones',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.white,
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
                      _buildSection(
                        'REFERENTE',
                        [
                          'La participación del cliente es voluntaria y sin costo.',
                          'Este programa (Amigos Marval) no contempla rifas ni sorteos.',
                          'Podrán participar todos los Clientes (a quienes se les llamará REFERENTES) del grupo MARVAL (Urbanizadora Marval S.A.S, Construcciones Marval S.A.S y Marval S.A.S a quienes se les llamará LAS EMPRESAS). Entendiendo como cliente aquella persona NATURAL que haya pagado el total de la separación de un inmueble de nuestra oferta disponible o que haya suscrito oferta de compraventa a partir del 15 de marzo de 2016; también se considerará referente la persona que este pagando la cuota inicial o haya escriturado un inmueble con las empresas. Nuestros clientes tienen la posibilidad de referir otros potenciales clientes.',
                          'El programa no aplica para personas jurídicas.',
                          'Quedan excluidos los funcionarios de las empresas del grupo Marval pertenecientes al área de ventas, trámite y cartera a nivel nacional; los demás funcionarios podrán participar siempre y cuando sean clientes.',
                          'El programa no aplica para referentes que hayan sido objeto de retiro o desistimiento de una oferta de venta con LAS EMPRESAS.',
                        ],
                      ),
                      _buildSection(
                        'PREMIOS',
                        [
                          'El premio será un valor en pesos que el referente podrá redimir en diferentes establecimientos comerciales por medio de bonos digitales otorgados a través de la empresa Quantum, proveedor contratado por LAS EMPRESAS para ofrecer este servicio.',
                          'Los premios están sujetos a los términos y condiciones de la empresa Quantum y podrán ser consultados antes de ser redimidos en la aplicación móvil Amigos Marval.',
                          'El valor de los premios podrá variar en cualquier momento, a criterio de LAS EMPRESAS, es decir es dinámico.',
                          'El programa aplica para PROYECTOS SELECCIONADOS por LAS EMPRESAS, relacionados en el apartado "Plan de Premios" de la aplicación móvil Amigos Marval y podrán variar en cualquier momento.',
                          'LAS EMPRESAS no se hacen responsables por la pérdida, vencimiento o cualquier novedad presentada con el premio. Quantum será el encargado directo de prestar el soporte en caso de alguna novedad o inquietud del cliente.',
                        ],
                      ),
                      _buildSection(
                        'REFERIDOS',
                        [
                          'El referido debe ser un cliente nuevo para LAS EMPRESAS es decir que no tenga ningún inmueble adquirido con LAS EMPRESAS.',
                          'El referente debe registrar al referido ANTES de que este realice la cotización de un inmueble con LAS EMPRESAS. De lo contrario, no podrá inscribirlo, ya que no será considerado un cliente NUEVO.',
                          'Cada vez que un referente registre a un referido, el referido recibirá una notificación por correo electrónico, y deberá dar su aprobación para participar en el programa, y autorizar el uso de sus datos personales a LAS EMPRESAS y a Quantum. Sin esto, el referido no podrá ser inscrito.',
                          'Cada vez que un referido sea efectivo, le será notificado al referente por medio de la sección notificaciones de la aplicación móvil Amigos Marval.',
                        ],
                      ),
                      _buildSection(
                        'CATEGORÍAS',
                        [
                          'El referente será clasificado por LAS EMPRESAS dentro de las siguientes 3 categorías de acuerdo con el número de referidos efectivos:',
                        ],
                      ),
                      _buildCategoryItem('Bronce', 'De 3 a 5 referidos efectivos'),
                      _buildCategoryItem('Plata', 'Entre 5 y 10 referidos efectivos'),
                      _buildCategoryItem('Oro', 'Más de 10 referidos efectivos'),
                      const SizedBox(height: 16),
                      _buildBulletPoint(
                          'El referido podrá ir subiendo de categoría de acuerdo con el número de referidos efectivos y obtener beneficios adicionales en viajes.'),
                      const SizedBox(height: 24),
                      _buildSection(
                        'SOPORTE Y CONDICIONES GENERALES',
                        [
                          'Los referentes tendrán soporte permanente sobre el programa Amigos Marval, por medio de un chat bot dispuesto en la aplicación móvil Amigos Marval, o en caso de requerirlo pueden establecer comunicación mediante el siguiente correo: amigosmarval@marval.com.co',
                          'El Programa Amigos Marval se reserva la facultad de rechazar la inscripción de toda persona que no cumpla los requisitos para participar del programa.',
                          'La sola inscripción no otorga el derecho al premio.',
                          'En caso de traslado de apartamento del referido a otro inmueble de LAS EMPRESAS, el referente recibirá el valor del premio correspondiente a la primera negociación.',
                          'El programa premia al referente por la cantidad de personas referidas y NO por el número de inmuebles que adquiera.',
                          'Si dos clientes (referentes) refieren a la misma persona (referido), primará el orden de ingreso del referido en la aplicación y será notificado inmediatamente.',
                          'El premio solo se entregará al cliente registrado en la aplicación móvil Amigos Marval y que haya aprobado todos los términos para ser ganador.',
                          'Los clientes no podrán transferir referidos entre sí. En caso de comprobarse, no sumarán para obtener premios.',
                          'Los clientes que sean ganadores de premio y residan en el exterior solo podrán redimirlo en las siguientes marcas: XXXXX',
                          'La promoción es intransferible, no negociable, no canjeable, ni por otros bienes o servicios y tendrá validez hasta el 31 de diciembre del 2026.',
                          'Los favorecidos aceptan de antemano las condiciones bajo las cuales las empresas lo han escogido sin derecho a reclamar por cambios generados en la dinámica.',
                          'Los participantes del premio liberan a LAS EMPRESAS de toda responsabilidad entendiendo que deciden participar por el premio en forma individual y por su propia voluntad y riesgo, por lo que aceptan y declaran que comprenden todas las cláusulas anteriores y renuncian a reclamar por cualquier medio, daño, pérdida o perjuicio alguno que se pueda ocasionar por el uso, disfrute o abuso de los beneficios de la promoción.',
                        ],
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Text(
                          'Última actualización: Diciembre 2024',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryBlue,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ...points.map((point) => _buildBulletPoint(point)),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppColors.primaryBlue,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                height: 1.6,
                color: AppColors.darkNavy,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String category, String description) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: category == 'Bronce'
                  ? AppColors.bronze
                  : category == 'Plata'
                      ? AppColors.silver
                      : AppColors.gold,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              category,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.darkNavy,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
