import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/widgets/ultra_button.dart';
import 'package:saint_roche_atomic_design/hamburger/controller/ham_controller.dart';
import 'package:saint_roche_atomic_design/hamburger/widgets/hamburger_checkbox.dart';
import 'package:saint_roche_atomic_design/hamburger/widgets/hamburger_selector.dart';
import '../../commons/widgets/ultra_app_bar.dart';
import '../model/ham_model.dart';

class HamburgerScreen extends StatefulWidget {
  const HamburgerScreen({super.key});

  @override
  State<HamburgerScreen> createState() => _HamburgerScreenState();
}

class _HamburgerScreenState extends State<HamburgerScreen> {
  List<int> hamQty = [0,0,0];
  List<HamType> hamTypes = HamType.values.toList();
  List<HamType> hamSelected = [];
  bool _isCreditCardPayment = false;

  void _getSelected() {
    hamSelected.clear();

    for(int i=0; i<hamQty.length;i++){
      int j = hamQty[i];
      while(j>0){
        hamSelected.add(hamTypes[i]);
        j--;
      }
    }
    final hamMdl = HamburgerModel(hamSelected);
    final hamCtrl = HamburgerController(hamMdl);

    final total = hamCtrl.calcularPago(_isCreditCardPayment);
    final extra = hamCtrl.calcularCargo(_isCreditCardPayment);

    Navigator.pushNamed(
        context, "/hamburger/result",
        arguments: {
          'total': total,
          'cargo': extra,
          'hamburgesas': hamSelected,
        }
    );
  }

  void _incrementQty(int index) {
    setState(() {
      hamQty[index]++;
    });
  }

  void _decrementQty(int index) {
    setState(() {
      if(hamQty[index] > 0) {
        hamQty[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UltraAppBar(appBarName: "El náufrago satisfecho"),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            for (int i = 0; i < hamQty.length; i++) ...[
              HamburgerSelector(
                price: "${hamTypes[i].precio}",
                name: hamTypes[i].nombre,
                count: hamQty[i],
                icon: Icons.wallet,
                onIncrement: () => _incrementQty(i),
                onDecrement: () => _decrementQty(i),
              ),
              SizedBox(height: 12,),
            ],
            SizedBox(height: 16,),
            HamburgerCheckbox(
              label: "Pagar con tarjeta de crédito",
              // esta función se llama cada vez que se actualiza
              // el checkbox. (value) es el valor interno del Widget (_isChecked)
              // con este "value" actualizamos el estado local de este Widget, es
              // decir (_isCreditCardPayment)
              onChanged: (value) {
                setState(() {
                  _isCreditCardPayment = value;
                });
              },
            ),
            SizedBox(height: 16,),
            UltraButton(label: "Calcular Total", onPressed: _getSelected),
          ],
        ),
      ),
    );
  }
}
