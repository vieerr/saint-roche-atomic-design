class Articulo {
  final double precio;
  final double descuento;
  final double total;

  Articulo({
    required this.precio,
    required this.descuento,
    required this.total,
  });

  // Calcula descuento según el precio
  factory Articulo.calcular(double precio) {
    double porcentajeDescuento;

    if (precio >= 200) {
      porcentajeDescuento = 0.15;
    } else if (precio > 100) {
      porcentajeDescuento = 0.12;
    } else {
      porcentajeDescuento = 0.10;
    }

    double descuento = precio * porcentajeDescuento;
    double total = precio - descuento;

    return Articulo(
      precio: precio,
      descuento: descuento,
      total: total,
    );
  }
}
