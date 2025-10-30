import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/widgets/home_button.dart';
import 'package:saint_roche_atomic_design/commons/widgets/ultra_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UltraAppBar(appBarName: "Ultra App"),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(30),
        crossAxisSpacing: 30,
        mainAxisSpacing: 40,
        crossAxisCount: 2,
        children: <Widget>[
          HomeButton(
              icon: Icons.account_balance_wallet_rounded,
              title: "Factura",
              onClick: () => Navigator.pushNamed(context, '/bill'),
          ),
          HomeButton(
            icon: Icons.home,
            title: "Prob2",
            onClick:  () => Navigator.pushNamed(context, '/'),
          ),
          HomeButton(
            icon: Icons.fastfood,
            title: "Hamburguesa",
            onClick: () => Navigator.pushNamed(context, '/hamburger'),
          ),
          HomeButton(
            icon: Icons.home,
            title: "Prob4",
            onClick:  () => Navigator.pushNamed(context, '/'),
          ),
          HomeButton(
            icon: Icons.calculate_rounded,
            title: "Promociones",
            onClick:  () => Navigator.pushNamed(context, '/products'),
          ),
        ],
      ),
    );
  }
}
