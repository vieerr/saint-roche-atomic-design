import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/widgets/ultra_app_bar.dart';
import '../../commons/styles/colors.dart';
import '../../commons/widgets/error_mesage.dart';
import '../../commons/widgets/ultra_button.dart';
import '../../commons/widgets/ultra_input.dart';

import '../controller/salary_controller.dart';

class SalarioPage extends StatefulWidget {
  const SalarioPage({super.key});

  @override
  State<SalarioPage> createState() => _SalarioPageState();
}

class _SalarioPageState extends State<SalarioPage> {
  final controller = SalarioController();
  final salarioCtrl = TextEditingController();
  String? errorMessage;

  void _calcular() {
    setState(() {
      errorMessage = null;
    });

    final input = salarioCtrl.text.trim();

    // ✅ Validación del input
    if (input.isEmpty) {
      setState(() {
        errorMessage = "Por favor, ingresa un salario inicial.";
      });
      return;
    }

    final salario = double.tryParse(input);

    if (salario == null) {
      setState(() {
        errorMessage = "El salario debe ser un número válido (sin letras ni símbolos).";
      });
      return;
    }

    if (salario <= 0) {
      setState(() {
        errorMessage = "El salario debe ser mayor que cero.";
      });
      return;
    }

    // ✅ Si todo está correcto, calcular y navegar
    final resultado = controller.calcularSalarios(salarioCtrl.text);
    Navigator.pushNamed(context, 'teacher/result', arguments: resultado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UltraColors.background,
      appBar: UltraAppBar(appBarName: 'Cálculo de Salario 🦖'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UltraInput(
              label: "Salario inicial del profesor",
              hint: "Ejemplo: 1200",
              icon: Icons.monetization_on_outlined,
              keyboardType: TextInputType.number,
              controller: salarioCtrl,
            ),
            ErrorMessage(errorText: errorMessage),
            const SizedBox(height: 20),
            UltraButton(
              label: "Calcular salario",
              onPressed: _calcular,
            ),
            const SizedBox(height: 40),
            const Text(
              "El salario aumenta un 10% anual durante 6 años",
              style: TextStyle(
                color: UltraColors.primaryDark,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
