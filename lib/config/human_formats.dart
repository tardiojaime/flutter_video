import 'package:intl/intl.dart';

class HumanFormats {
  // readable - legible
  static String humanReadbleNumber(double number) {
    // utilizando el paquete de intl para pasar de 288233829 a 28M o 23k
    return NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
        .format(number);
  }
}
