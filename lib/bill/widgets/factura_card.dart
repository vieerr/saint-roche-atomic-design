import 'package:flutter/material.dart';
import '../widgets/factura_detail_row.dart';
import '../../commons/styles/colors.dart';

const double IVA = 0.15;

class FacturaCard extends StatelessWidget {
  final double totalVentas;
  final double descuento;

  const FacturaCard({
    super.key,
    required this.totalVentas,
    required this.descuento
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Factura",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: UltraColors.primaryDark,
                ),
              ),
            ),

            Divider(height: 24),

            FacturaDetailRow(
              icon: Icons.sell,
              label: "Total Ventas",
              value: "\$${totalVentas.toStringAsFixed(2)}",
            ),
            SizedBox(height: 12),

            FacturaDetailRow(
              icon: Icons.payments,
              label: "IVA (15%)",
              value: "\$${(totalVentas * IVA).toStringAsFixed(2)}",
            ),
            SizedBox(height: 12),

            FacturaDetailRow(
              icon: Icons.discount,
              label: "Descuento Aplicado",
              value: "-\$${descuento.toStringAsFixed(2)}",
              valueColor: Colors.red.shade600,
            ),

            Divider(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Pagado",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: UltraColors.primaryDark,
                  ),
                ),
                Text(
                  "\$${totalVentas + (totalVentas * IVA) - descuento}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}