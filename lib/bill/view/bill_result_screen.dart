import 'package:flutter/material.dart';
import '../widgets/factura_card.dart';
import '../widgets/sueldo_card.dart';
import '../../commons/widgets/ultra_app_bar.dart';

class BillResultScreen extends StatelessWidget {
  const BillResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, double>;

    final double totalVentas = args['totalVentas']!;
    final double sueldo = args['sueldo']!;
    final double descuento = args['descuento']!;

    return Scaffold(
      appBar: UltraAppBar(appBarName: "Resultados"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SueldoCard(sueldo: sueldo),
            SizedBox(height: 24),
            FacturaCard(totalVentas: totalVentas, descuento: descuento),
          ],
        ),
      ),
    );
  }
}