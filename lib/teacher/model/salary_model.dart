class SalarioModel {
  final double salarioInicial;
  final double incremento;
  final int anios;

  SalarioModel({
    required this.salarioInicial,
    this.incremento = 0.10,
    this.anios = 5,
  });

  List<double> calcularSalarios() {
    List<double> salarios = [salarioInicial];
    double actual = salarioInicial;

    for (int i = 1; i <= anios; i++) {
      actual += actual * incremento;
      salarios.add(double.parse(actual.toStringAsFixed(2)));
    }

    return salarios;
  }

  double obtenerSalarioFinal() {
    return calcularSalarios().last;
  }
}
