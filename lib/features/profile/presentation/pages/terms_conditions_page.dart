import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/theme_extensions.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Expanded(
                    child: Text(
                      'TÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©rminos y condiciones',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: context.primaryBlue,
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
                      _buildSection(context, 'REFERENTE',
                        [
                          'La participaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n del cliente es voluntaria y sin costo.',
                          'Este programa (Amigos Marval) no contempla rifas ni sorteos.',
                          'PodrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡n participar todos los Clientes (a quienes se les llamarÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ REFERENTES) del grupo MARVAL (Urbanizadora Marval S.A.S, Construcciones Marval S.A.S y Marval S.A.S a quienes se les llamarÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ LAS EMPRESAS). Entendiendo como cliente aquella persona NATURAL que haya pagado el total de la separaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n de un inmueble de nuestra oferta disponible o que haya suscrito oferta de compraventa a partir del 15 de marzo de 2016; tambiÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©n se considerarÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ referente la persona que este pagando la cuota inicial o haya escriturado un inmueble con las empresas. Nuestros clientes tienen la posibilidad de referir otros potenciales clientes.',
                          'El programa no aplica para personas jurÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â­dicas.',
                          'Quedan excluidos los funcionarios de las empresas del grupo Marval pertenecientes al ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡rea de ventas, trÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡mite y cartera a nivel nacional; los demÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡s funcionarios podrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡n participar siempre y cuando sean clientes.',
                          'El programa no aplica para referentes que hayan sido objeto de retiro o desistimiento de una oferta de venta con LAS EMPRESAS.',
                        ],
                      ),
                      _buildSection(context, 'PREMIOS',
                        [
                          'El premio serÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ un valor en pesos que el referente podrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ redimir en diferentes establecimientos comerciales por medio de bonos digitales otorgados a travÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©s de la empresa Quantum, proveedor contratado por LAS EMPRESAS para ofrecer este servicio.',
                          'Los premios estÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡n sujetos a los tÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©rminos y condiciones de la empresa Quantum y podrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡n ser consultados antes de ser redimidos en la aplicaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n mÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³vil Amigos Marval.',
                          'El valor de los premios podrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ variar en cualquier momento, a criterio de LAS EMPRESAS, es decir es dinÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡mico.',
                          'El programa aplica para PROYECTOS SELECCIONADOS por LAS EMPRESAS, relacionados en el apartado "Plan de Premios" de la aplicaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n mÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³vil Amigos Marval y podrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡n variar en cualquier momento.',
                          'LAS EMPRESAS no se hacen responsables por la pÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©rdida, vencimiento o cualquier novedad presentada con el premio. Quantum serÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ el encargado directo de prestar el soporte en caso de alguna novedad o inquietud del cliente.',
                        ],
                      ),
                      _buildSection(context, 'REFERIDOS',
                        [
                          'El referido debe ser un cliente nuevo para LAS EMPRESAS es decir que no tenga ningÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Âºn inmueble adquirido con LAS EMPRESAS.',
                          'El referente debe registrar al referido ANTES de que este realice la cotizaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n de un inmueble con LAS EMPRESAS. De lo contrario, no podrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ inscribirlo, ya que no serÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ considerado un cliente NUEVO.',
                          'Cada vez que un referente registre a un referido, el referido recibirÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ una notificaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n por correo electrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³nico, y deberÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ dar su aprobaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n para participar en el programa, y autorizar el uso de sus datos personales a LAS EMPRESAS y a Quantum. Sin esto, el referido no podrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ ser inscrito.',
                          'Cada vez que un referido sea efectivo, le serÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ notificado al referente por medio de la secciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n notificaciones de la aplicaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n mÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³vil Amigos Marval.',
                        ],
                      ),
                      _buildSection(context, 'CATEGORÃƒÆ’Ã†â€™Ãƒâ€šÃ‚ÂAS',
                        [
                          'El referente serÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ clasificado por LAS EMPRESAS dentro de las siguientes 3 categorÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â­as de acuerdo con el nÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Âºmero de referidos efectivos:',
                        ],
                      ),
                      _buildCategoryItem(context, 'Bronce', 'De 3 a 5 referidos efectivos'),
                      _buildCategoryItem(context, 'Plata', 'Entre 5 y 10 referidos efectivos'),
                      _buildCategoryItem(context, 'Oro', 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡s de 10 referidos efectivos'),
                      const SizedBox(height: 16),
                      _buildBulletPoint(context, 'El referido podrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ ir subiendo de categorÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â­a de acuerdo con el nÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Âºmero de referidos efectivos y obtener beneficios adicionales en viajes.'),
                      const SizedBox(height: 24),
                      _buildSection(context, 'SOPORTE Y CONDICIONES GENERALES',
                        [
                          'Los referentes tendrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡n soporte permanente sobre el programa Amigos Marval, por medio de un chat bot dispuesto en la aplicaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n mÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³vil Amigos Marval, o en caso de requerirlo pueden establecer comunicaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n mediante el siguiente correo: amigosmarval@marval.com.co',
                          'El Programa Amigos Marval se reserva la facultad de rechazar la inscripciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n de toda persona que no cumpla los requisitos para participar del programa.',
                          'La sola inscripciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n no otorga el derecho al premio.',
                          'En caso de traslado de apartamento del referido a otro inmueble de LAS EMPRESAS, el referente recibirÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ el valor del premio correspondiente a la primera negociaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n.',
                          'El programa premia al referente por la cantidad de personas referidas y NO por el nÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Âºmero de inmuebles que adquiera.',
                          'Si dos clientes (referentes) refieren a la misma persona (referido), primarÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ el orden de ingreso del referido en la aplicaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n y serÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ notificado inmediatamente.',
                          'El premio solo se entregarÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ al cliente registrado en la aplicaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n mÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³vil Amigos Marval y que haya aprobado todos los tÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©rminos para ser ganador.',
                          'Los clientes no podrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡n transferir referidos entre sÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â­. En caso de comprobarse, no sumarÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡n para obtener premios.',
                          'Los clientes que sean ganadores de premio y residan en el exterior solo podrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡n redimirlo en las siguientes marcas: XXXXX',
                          'La promociÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n es intransferible, no negociable, no canjeable, ni por otros bienes o servicios y tendrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡ validez hasta el 31 de diciembre del 2026.',
                          'Los favorecidos aceptan de antemano las condiciones bajo las cuales las empresas lo han escogido sin derecho a reclamar por cambios generados en la dinÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡mica.',
                          'Los participantes del premio liberan a LAS EMPRESAS de toda responsabilidad entendiendo que deciden participar por el premio en forma individual y por su propia voluntad y riesgo, por lo que aceptan y declaran que comprenden todas las clÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡usulas anteriores y renuncian a reclamar por cualquier medio, daÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â±o, pÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©rdida o perjuicio alguno que se pueda ocasionar por el uso, disfrute o abuso de los beneficios de la promociÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n.',
                        ],
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Text(
                          'ÃƒÆ’Ã†â€™Ãƒâ€¦Ã‚Â¡ltima actualizaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n: Diciembre 2024',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: context.textSecondary,
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

  Widget _buildSection(BuildContext context, String title, List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: context.primaryBlue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: context.primaryBlue,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ...points.map((point) => _buildBulletPoint(context, point)),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildBulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: context.primaryBlue,
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
                color: context.darkNavy,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String category, String description) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: category == 'Bronce'
                  ? context.bronze
                  : category == 'Plata'
                      ? context.silver
                      : context.gold,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              category,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: context.darkNavy,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
