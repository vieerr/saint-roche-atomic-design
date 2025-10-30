import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/widgets/error_mesage.dart';
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
  final hamCtrl = HamburgerController();
  bool _isCreditCardPayment = false;
  String _errMsg = "";

  void _computeAllHamburgers() {
    setState(() {
      _errMsg = hamCtrl.allHamburgersZero();
    });

    if(_errMsg != "") {
      return;
    }

    double charge = 0;
    if(_isCreditCardPayment){
      charge = hamCtrl.charge;
    }

    Navigator.pushNamed(
      context, "/hamburger/result",
      arguments: {
        'total': hamCtrl.total,
        'recargo': charge,
        'hamburgesas': hamCtrl.hamburgers,
      }
    );
  }

  void _incrementQty(HamburgerModel hamburger) {
    setState(() {
      hamCtrl.increaseQty(hamburger);
    });
  }

  void _decrementQty(HamburgerModel hamburger) {
    setState(() {
      hamCtrl.decreaseQty(hamburger);
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
            for (int i = 0; i < hamCtrl.hamburgers.length; i++) ...[
              HamburgerSelector(
                hamItem: hamCtrl.hamburgers[i],
                icon: Icons.wallet,
                onIncrement: () => _incrementQty(hamCtrl.hamburgers[i]),
                onDecrement: () => _decrementQty(hamCtrl.hamburgers[i]),
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
            UltraButton(label: "Calcular Total", onPressed: _computeAllHamburgers),
            SizedBox(height: 16,),
            ErrorMessage(errorText: _errMsg,),
          ],
        ),
      ),
    );
  }
}
