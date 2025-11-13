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
                      'Terminos y condiciones',
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
                          'La participacion del cliente es voluntaria y sin costo.',
                          'Este programa (Amigos Marval) no contempla rifas ni sorteos.',
                          'Podran participar todos los Clientes (a quienes se les llamara REFERENTES) del grupo MARVAL (Urbanizadora Marval S.A.S, Construcciones Marval S.A.S y Marval S.A.S a quienes se les llamara LAS EMPRESAS). Entendiendo como cliente aquella persona NATURAL que haya pagado el total de la separacion de un inmueble de nuestra oferta disponible o que haya suscrito oferta de compraventa a partir del 15 de marzo de 2016; tambien se considerara referente la persona que este pagando la cuota inicial o haya escriturado un inmueble con las empresas. Nuestros clientes tienen la posibilidad de referir otros potenciales clientes.',
                          'El programa no aplica para personas juridicas.',
                          'Quedan excluidos los funcionarios de las empresas del grupo Marval pertenecientes al area de ventas, tramite y cartera a nivel nacional; los demas funcionarios podran participar siempre y cuando sean clientes.',
                          'El programa no aplica para referentes que hayan sido objeto de retiro o desistimiento de una oferta de venta con LAS EMPRESAS.',
                        ],
                      ),
                      _buildSection(context, 'PREMIOS',
                        [
                          'El premio sera un valor en pesos que el referente podra redimir en diferentes establecimientos comerciales por medio de bonos digitales otorgados a traves de la empresa Quantum, proveedor contratado por LAS EMPRESAS para ofrecer este servicio.',
                          'Los premios estan sujetos a los terminos y condiciones de la empresa Quantum y podran ser consultados antes de ser redimidos en la aplicacion movil Amigos Marval.',
                          'El valor de los premios podra variar en cualquier momento, a criterio de LAS EMPRESAS, es decir es dinamico.',
                          'El programa aplica para PROYECTOS SELECCIONADOS por LAS EMPRESAS, relacionados en el apartado "Plan de Premios" de la aplicacion movil Amigos Marval y podran variar en cualquier momento.',
                          'LAS EMPRESAS no se hacen responsables por la perdida, vencimiento o cualquier novedad presentada con el premio. Quantum sera el encargado directo de prestar el soporte en caso de alguna novedad o inquietud del cliente.',
                        ],
                      ),
                      _buildSection(context, 'REFERIDOS',
                        [
                          'El referido debe ser un cliente nuevo para LAS EMPRESAS es decir que no tenga ningun inmueble adquirido con LAS EMPRESAS.',
                          'El referente debe registrar al referido ANTES de que este realice la cotizacion de un inmueble con LAS EMPRESAS. De lo contrario, no podra inscribirlo, ya que no sera considerado un cliente NUEVO.',
                          'Cada vez que un referente registre a un referido, el referido recibira una notificacion por correo electronico, y debera dar su aprobacion para participar en el programa, y autorizar el uso de sus datos personales a LAS EMPRESAS y a Quantum. Sin esto, el referido no podra ser inscrito.',
                          'Cada vez que un referido sea efectivo, le sera notificado al referente por medio de la seccion notificaciones de la aplicacion movil Amigos Marval.',
                        ],
                      ),
                      _buildSection(context, 'CATEGORIAS',
                        [
                          'El referente sera clasificado por LAS EMPRESAS dentro de las siguientes 3 categorias de acuerdo con el numero de referidos efectivos:',
                        ],
                      ),
                      _buildCategoryItem(context, 'Bronce', 'De 3 a 5 referidos efectivos'),
                      _buildCategoryItem(context, 'Plata', 'Entre 5 y 10 referidos efectivos'),
                      _buildCategoryItem(context, 'Oro', 'Mas de 10 referidos efectivos'),
                      const SizedBox(height: 16),
                      _buildBulletPoint(context, 'El referido podra ir subiendo de categoria de acuerdo con el numero de referidos efectivos y obtener beneficios adicionales en viajes.'),
                      const SizedBox(height: 24),
                      _buildSection(context, 'SOPORTE Y CONDICIONES GENERALES',
                        [
                          'Los referentes tendran soporte permanente sobre el programa Amigos Marval, por medio de un chat bot dispuesto en la aplicacion movil Amigos Marval, o en caso de requerirlo pueden establecer comunicacion mediante el siguiente correo: amigosmarval@marval.com.co',
                          'El Programa Amigos Marval se reserva la facultad de rechazar la inscripcion de toda persona que no cumpla los requisitos para participar del programa.',
                          'La sola inscripcion no otorga el derecho al premio.',
                          'En caso de traslado de apartamento del referido a otro inmueble de LAS EMPRESAS, el referente recibira el valor del premio correspondiente a la primera negociacion.',
                          'El programa premia al referente por la cantidad de personas referidas y NO por el numero de inmuebles que adquiera.',
                          'Si dos clientes (referentes) refieren a la misma persona (referido), primara el orden de ingreso del referido en la aplicacion y sera notificado inmediatamente.',
                          'El premio solo se entregara al cliente registrado en la aplicacion movil Amigos Marval y que haya aprobado todos los terminos para ser ganador.',
                          'Los clientes no podran transferir referidos entre si. En caso de comprobarse, no sumaran para obtener premios.',
                          'Los clientes que sean ganadores de premio y residan en el exterior solo podran redimirlo en las siguientes marcas: XXXXX',
                          'La promocion es intransferible, no negociable, no canjeable, ni por otros bienes o servicios y tendra validez hasta el 31 de diciembre del 2026.',
                          'Los favorecidos aceptan de antemano las condiciones bajo las cuales las empresas lo han escogido sin derecho a reclamar por cambios generados en la dinamica.',
                          'Los participantes del premio liberan a LAS EMPRESAS de toda responsabilidad entendiendo que deciden participar por el premio en forma individual y por su propia voluntad y riesgo, por lo que aceptan y declaran que comprenden todas las clausulas anteriores y renuncian a reclamar por cualquier medio, dano, perdida o perjuicio alguno que se pueda ocasionar por el uso, disfrute o abuso de los beneficios de la promocion.',
                        ],
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Text(
                          'Ultima actualizacion: Diciembre 2024',
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
