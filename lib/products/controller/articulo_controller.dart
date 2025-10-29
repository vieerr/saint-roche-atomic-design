import '../model/articulo_model.dart';

class ArticuloController {
  final List<Articulo> _articulos = [];

  List<Articulo> get articulos => _articulos;

  void agregarArticulo(double precio) {
    _articulos.add(Articulo.calcular(precio));
  }

  void limpiar() {
    _articulos.clear();
  }

  double calcularTotal() {
    return _articulos.fold(0, (sum, item) => sum + item.total);
  }
}
