import 'package:saint_roche_atomic_design/hamburger/model/ham_model.dart';

class HamburgerController {
  double calcularPago(List<HamType> hamItems, bool isCreditCardPayment){

    final hamModel = HamburgerModel(hamItems);
    final total = hamModel.getPayment(isCreditCardPayment);

    return total;
  }
}