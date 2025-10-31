import '../model/salary_model.dart';

class SalarioController {
  Map<String, dynamic> calcularSalarios(String salarioStr) {
    try {
      double salario = double.parse(salarioStr);
      final modelo = SalarioModel(salarioInicial: salario);
      final lista = modelo.calcularSalarios();

      return {
        'salarios': lista,
        'salarioFinal': modelo.obtenerSalarioFinal(),
      };
    } catch (e) {
      return {
        'error': "Ingresa un número válido para el salario inicial."
      };
    }
  }
}
