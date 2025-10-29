const double RECARGO = 0.05;

enum HamType {
  sencilla('Sencilla', 20),
  doble('Doble', 25),
  triple('Triple', 28);

  final String nombre;
  final double precio;
  const HamType(this.nombre, this.precio);
}

class HamburgerModel {
  final List<HamType> hambuergers;

  HamburgerModel(this.hambuergers);

  double getPayment(bool payWithCreditCard) {
    double total = 0;

    for(int i=0; i<hambuergers.length;i++) {
      total += hambuergers[i].precio;
    }

    if(payWithCreditCard) {
      double extra = total * RECARGO;
      return total + extra;
    }

    return total;
  }
}