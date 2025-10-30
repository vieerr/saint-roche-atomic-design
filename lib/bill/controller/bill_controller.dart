import '../model/bill_model.dart';

class BillController{
  (double, double, double, String) calcularDatos(String s1, String s2, String s3) {
    if(s1.isEmpty || s2.isEmpty || s3.isEmpty) {
      String err = "Llene todos los campos para continuar";
      return (0,0,0,err);
    }

    final v1 = double.tryParse(s1);
    final v2 = double.tryParse(s2);
    final v3 = double.tryParse(s3);

    if(v1 == null || v2 == null || v3 == null) {
      String err = "Ingrese un valor numérico";
      return (0,0,0,err);
    }

    if(v1 <= 0 || v2 <= 0 || v3 <= 0) {
      String err = "¡No puede haber valores negativos o iguales a cero!";
      return (0,0,0,err);
    }

    final billModel = BillModel(v1, v2, v3);
    final sueldo = billModel.calcularSueldo();
    final descuento = billModel.obtenerDescuento();

    return (billModel.totalVentas, sueldo, descuento, "");
  }
}