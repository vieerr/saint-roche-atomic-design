import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/styles/colors.dart';
import 'package:saint_roche_atomic_design/commons/widgets/ultra_app_bar.dart';
import 'package:saint_roche_atomic_design/bill/widgets/factura_detail_row.dart';

class NumbersResultScreen extends StatelessWidget {
  const NumbersResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, int>;

    final int zeros = args['zeros']!;
    final int negatives = args['negatives']!;
    final int positives = args['positives']!;
    final int total = zeros + negatives + positives;

    return Scaffold(
      appBar: UltraAppBar(appBarName: "Resultados"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
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
                    "Análisis de Números",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: UltraColors.primaryDark,
                    ),
                  ),
                ),
                Divider(height: 24),
                FacturaDetailRow(
                  label: "Ceros",
                  value: "$zeros",
                  valueColor: Colors.grey,
                ),
                SizedBox(height: 12),
                FacturaDetailRow(
                  label: "Menores a cero",
                  value: "$negatives",
                  valueColor: Colors.red,
                ),
                SizedBox(height: 12),
                FacturaDetailRow(
                  label: "Mayores a cero",
                  value: "$positives",
                  valueColor: Colors.green,
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
                      "$total",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: UltraColors.primaryDark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
