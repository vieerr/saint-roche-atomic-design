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
    final double cargo = args['cargo']!;
    final List<HamType> hamburguesas = args['hamburgesas']!;


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

              FacturaDetailRow(
                label: "Sencillas x 2",
                value: "\$${total.toStringAsFixed(2)}",
              ),
              SizedBox(height: 12),

              FacturaDetailRow(
                label: "Cargo Aplicado",
                value: "\$${cargo.toStringAsFixed(2)}",
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
                    "\$$total",
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
