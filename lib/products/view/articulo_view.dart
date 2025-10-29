import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/widgets/error_mesage.dart';
import 'package:saint_roche_atomic_design/commons/widgets/ultra_app_bar.dart';
import '../controller/articulo_controller.dart';
import '../widgets/articulo_cart.dart';
import '../../commons/widgets/ultra_input.dart';
import '../../commons/widgets/ultra_button.dart';
import '../../commons/styles/colors.dart';

class ArticuloView extends StatefulWidget {
  const ArticuloView({super.key});

  @override
  State<ArticuloView> createState() => _ArticuloViewState();
}

class _ArticuloViewState extends State<ArticuloView> {
  final ArticuloController controller = ArticuloController();
  final TextEditingController precioController = TextEditingController();
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UltraAppBar(appBarName: 'Cálculo de Promociones'),
      backgroundColor: UltraColors.primaryLight.withValues(alpha: 0.1),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            UltraInput(
              label: "Precio del artículo",
              hint: "Ejemplo: 150",
              icon: Icons.attach_money,
              keyboardType: TextInputType.number,
              controller: precioController,
            ),
            if (errorText != null) ErrorMessage(errorText: errorText!),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: UltraButton(
                    label: "Agregar",
                    onPressed: () {
                      final precio = double.tryParse(precioController.text);
                      if (precio == null || precio <= 0) {
                        setState(() => errorText = "Ingrese un precio válido");
                      } else {
                        setState(() {
                          errorText = null;
                          controller.agregarArticulo(precio);
                          precioController.clear();
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: UltraButton(
                    label: "Limpiar",
                    onPressed: () {
                      setState(() {
                        controller.limpiar();
                        errorText = null;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: controller.articulos.isEmpty
                  ? const Center(
                child: Text("No hay artículos agregados"),
              )
                  : ListView.builder(
                itemCount: controller.articulos.length,
                itemBuilder: (context, index) {
                  return ArticuloCard(articulo: controller.articulos[index]);
                },
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: UltraColors.primary),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Total a pagar: \$${controller.calcularTotal().toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: UltraColors.primaryDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
