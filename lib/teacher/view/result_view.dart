import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/widgets/ultra_app_bar.dart';
import '../../commons/styles/colors.dart';

class ResultadoScreen extends StatelessWidget {
  const ResultadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resultado = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final List<double>? salarios = resultado['salarios'] as List<double>?;
    final double? salarioFinal = resultado['salarioFinal'] as double?;
    final String? error = resultado['error'] as String?;

    return Scaffold(
      backgroundColor: UltraColors.background,
      appBar: UltraAppBar(appBarName: 'Resultados'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: error != null
            ? Center(
          child: Text(
            error,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Resumen de Salarios',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: UltraColors.primaryDark,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: salarios!.length,
                itemBuilder: (context, index) {
                  final salario = salarios[index];
                  return Card(
                    color: UltraColors.primaryLight,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: UltraColors.primary.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                        UltraColors.primary.withOpacity(0.85),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        'Año ${index + 1}',
                        style: const TextStyle(
                          color: UltraColors.primaryDark,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        '\$${salario.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: UltraColors.primaryDark,
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    '💰 Salario Final: \$${salarioFinal!.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
