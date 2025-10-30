import 'package:saint_roche_atomic_design/hamburger/model/ham_model.dart';

class HamburgerController {
  final HamburgerModel hamModel;

  HamburgerController(this.hamModel);

  double calcularPago(bool isCreditCardPayment){
    return hamModel.getPayment(isCreditCardPayment);
  }

  double get total => hamModel.getTotal();

  double calcularCargo(bool isCreditCardPayment){
    return hamModel.getExtra(total, isCreditCardPayment);
  }
}