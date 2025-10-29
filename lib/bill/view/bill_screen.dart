import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/widgets/error_mesage.dart';
import 'package:saint_roche_atomic_design/commons/widgets/ultra_app_bar.dart';
import '../controller/bill_controller.dart';

import '../../commons/widgets/ultra_button.dart';
import '../../commons/widgets/ultra_input.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  final mainctrl = BillController();
  final venta1ctrl = TextEditingController();
  final venta2ctrl = TextEditingController();
  final venta3ctrl = TextEditingController();

  String msgErr = "";

  void _calcular() {
    final (totalVentas, sueldo, descuento, err) = mainctrl.calcularDatos(
        venta1ctrl.text,
        venta2ctrl.text,
        venta3ctrl.text,
    );

    // actualizar mensaje de error
    setState(() {
      msgErr = err;
    });

    // no mostrar pasar a la siguiente pantalla si hubo un error
    if(err != "") {
      return;
    }



    Navigator.pushNamed(
        context, "/bill/result",
        arguments: {
          'totalVentas': totalVentas,
          'sueldo': sueldo,
          'descuento': descuento,
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UltraAppBar(appBarName: "Factura"),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            UltraInput(
              label: "Venta 1",
              hint: "Ingresa el valor de la venta",
              controller: venta1ctrl,
              icon: Icons.attach_money,
            ),
            SizedBox(height: 12,),
            UltraInput(
              label: "Venta 2",
              hint: "Ingresa el valor de la venta",
              controller: venta2ctrl,
              icon: Icons.attach_money,
            ),
            SizedBox(height: 12,),
            UltraInput(
              label: "Venta 3",
              hint: "Ingresa el valor de la venta",
              controller: venta3ctrl,
              icon: Icons.attach_money,
            ),
            SizedBox(height: 16,),
            ErrorMessage(errorText: msgErr,),
            UltraButton(
                label: "Calcular sueldo",
                onPressed: _calcular,
              elevation: 8,
            ),
          ],
        ),
      ),
    );
  }
}
