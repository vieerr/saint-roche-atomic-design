import '../model/numbers_model.dart';

class NumbersController {
  (int, int, int, String) procesarNumeros(
    String cantidad,
    List<String> valores,
  ) {
    if (cantidad.isEmpty) {
      String err = "Ingrese la cantidad de números";
      return (0, 0, 0, err);
    }

    final n = int.tryParse(cantidad);

    if (n == null) {
      String err = "Ingrese un valor numérico válido";
      return (0, 0, 0, err);
    }

    if (n <= 0) {
      String err = "La cantidad debe ser mayor a cero";
      return (0, 0, 0, err);
    }

    if (valores.length != n) {
      String err = "Debe ingresar exactamente $n números";
      return (0, 0, 0, err);
    }

    List<double> numeros = [];
    for (int i = 0; i < valores.length; i++) {
      if (valores[i].isEmpty) {
        String err = "Complete todos los campos";
        return (0, 0, 0, err);
      }

      final valor = double.tryParse(valores[i]);
      if (valor == null) {
        String err = "Ingrese valores numéricos válidos";
        return (0, 0, 0, err);
      }

      numeros.add(valor);
    }

    final model = NumbersModel(numeros);
    return (model.zeros, model.negatives, model.positives, "");
  }
}
