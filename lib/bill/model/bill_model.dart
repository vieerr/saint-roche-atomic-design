class BillModel {
  final double venta1;
  final double venta2;
  final double venta3;

  BillModel(this.venta1, this.venta2, this.venta3);

  // Getter total ventas
  double get totalVentas => venta1 + venta2 + venta3;

  double calcularSueldo() {
    double sueldoBase = 36500;
    double comision = totalVentas * 0.12;
    return sueldoBase + comision;
  }

  double obtenerDescuento() {
    if(totalVentas >= 2000){
      return totalVentas * 0.20;
    }
    return 0;
  }
}