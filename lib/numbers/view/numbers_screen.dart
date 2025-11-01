import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/widgets/error_mesage.dart';
import 'package:saint_roche_atomic_design/commons/widgets/ultra_app_bar.dart';
import 'package:saint_roche_atomic_design/commons/widgets/ultra_button.dart';
import 'package:saint_roche_atomic_design/commons/widgets/ultra_input.dart';
import '../controller/numbers_controller.dart';

class NumbersScreen extends StatefulWidget {
  const NumbersScreen({super.key});

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {
  final ctrl = NumbersController();
  final cantidadCtrl = TextEditingController();
  List<TextEditingController> valoresCtrl = [];
  int cantidad = 0;
  String msgErr = "";

  void _actualizarCantidad() {
    final n = int.tryParse(cantidadCtrl.text);
    if (n != null && n > 0 && n <= 20) {
      setState(() {
        cantidad = n;
        valoresCtrl = List.generate(n, (index) => TextEditingController());
        msgErr = "";
      });
    } else if (n != null && n > 20) {
      setState(() {
        msgErr = "La cantidad no puede ser mayor a 20";
        cantidad = 0;
        valoresCtrl = [];
      });
    } else {
      setState(() {
        cantidad = 0;
        valoresCtrl = [];
        msgErr = "";
      });
    }
  }

  void _calcular() {
    List<String> valores = valoresCtrl.map((c) => c.text).toList();
    final (zeros, negatives, positives, err) = ctrl.procesarNumeros(
      cantidadCtrl.text,
      valores,
    );

    setState(() {
      msgErr = err;
    });

    if (err != "") {
      return;
    }

    Navigator.pushNamed(
      context,
      "/numbers/result",
      arguments: {
        'zeros': zeros,
        'negatives': negatives,
        'positives': positives,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UltraAppBar(appBarName: "Números"),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UltraInput(
                label: "Cantidad de números",
                hint: "Ingrese cuántos números procesará",
                controller: cantidadCtrl,
                icon: Icons.numbers,
              ),
              SizedBox(height: 12),
              UltraButton(
                label: "Generar campos",
                onPressed: _actualizarCantidad,
              ),
              SizedBox(height: 16),
              if (cantidad > 0) ...[
                for (int i = 0; i < cantidad; i++) ...[
                  UltraInput(
                    label: "Número ${i + 1}",
                    hint: "Ingrese el valor",
                    controller: valoresCtrl[i],
                    icon: Icons.input,
                  ),
                  SizedBox(height: 12),
                ],
                SizedBox(height: 16),
                ErrorMessage(errorText: msgErr),
                UltraButton(
                  label: "Calcular",
                  onPressed: _calcular,
                  elevation: 8,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
