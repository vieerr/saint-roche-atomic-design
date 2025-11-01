import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/bill/widgets/factura_detail_row.dart';
import 'package:saint_roche_atomic_design/commons/styles/colors.dart';
import 'package:saint_roche_atomic_design/commons/widgets/ultra_app_bar.dart';
import 'package:saint_roche_atomic_design/hamburger/model/ham_model.dart';

class HamburgerResult extends StatelessWidget {
  const HamburgerResult({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final double total = args['total']!;
    final double recargo = args['recargo']!;
    final List<HamburgerModel> hamburguesas = args['hamburgesas']!;

    return Scaffold(
      appBar: UltraAppBar(appBarName: "Cuenta"),
      body: Card(
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

              for (var ham in hamburguesas) ...[
                if(ham.quantity > 0) ...[
                  FacturaDetailRow(
                    label: "${ham.hamburger.name} x ${ham.quantity}",
                    value: "\$${ham.total.toStringAsFixed(2)}",
                  ),
                  SizedBox(height: 12,),
                ],
              ],

              Divider(height: 12),
              FacturaDetailRow(
                label: "Recargo Aplicado",
                value: "\$${recargo.toStringAsFixed(2)}",
                valueColor: Colors.blueAccent,
              ),

              Divider(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: UltraColors.primaryDark,
                    ),
                  ),
                  Text(
                    "\$${total + recargo}",
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
      ),
    );
  }
}
