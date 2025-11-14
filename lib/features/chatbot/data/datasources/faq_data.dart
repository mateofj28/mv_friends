import '../../domain/models/faq_item.dart';

class FaqData {
  static const List<FaqItem> faqs = [
    FaqItem(
      question: 'Como puedo participar del programa?',
      answer: 'Es muy facil, puedes participar y ganar con este programa siempre y cuando seas cliente Marval y hayas adquirido una vivienda posterior a marzo del 2016. Cuentale a tus amigos y familiares las ventajas de adquirir un inmueble con nosotros, cuando alguno de ellos compre tu recibiras un premio.',
    ),
    FaqItem(
      question: 'Si mi referido ya tiene un apto con ustedes lo puedo referir para comprar otro?',
      answer: 'Ups lo sentimos no es posible, tu referido debe ser un cliente nuevo es decir que no tenga ningun inmueble con nosotros.',
    ),
    FaqItem(
      question: 'Donde puedo reclamar mi premio si estoy fuera del pais?',
      answer: 'Claro que si, tenemos establecimientos comerciales especiales para ti que estas en el exterior, al momento de redimir te apareceran las opciones para que elijas el de tu preferencia.',
    ),
  ];
}
