import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/styles/colors.dart';
import '../model/articulo_model.dart';

class ArticuloCard extends StatelessWidget {
  final Articulo articulo;

  const ArticuloCard({super.key, required this.articulo});

  // Calcula el porcentaje de descuento como entero
  String get porcentajeDescuento {
    double porcentaje;
    if (articulo.precio >= 200) {
      porcentaje = 15;
    } else if (articulo.precio > 100) {
      porcentaje = 12;
    } else {
      porcentaje = 10;
    }
    return "${porcentaje.toStringAsFixed(0)}%";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: UltraColors.primaryLight,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Precio original
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Precio: \$${articulo.precio.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: UltraColors.primaryDark,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Desc: \$${articulo.descuento.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: UltraColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Porcentaje de descuento
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: UltraColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                porcentajeDescuento,
                style: TextStyle(
                  color: UltraColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Total a pagar
            Expanded(
              flex: 1,
              child: Text(
                "Total: \$${articulo.total.toStringAsFixed(2)}",
                style: TextStyle(
                  color: UltraColors.primaryDark,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
