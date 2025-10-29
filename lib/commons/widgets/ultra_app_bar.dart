import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/styles/colors.dart';

class UltraAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarName;

  const UltraAppBar({super.key, required this.appBarName});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // determinar si en el contexto actual se puede regresar (hacer Pop)
    final bool canPop = Navigator.canPop(context);

    // Mostrar el widget de IconButton solo si
    // puede navegar hacia atras (hacer Pop)
    final Widget? returnNav = (canPop ?
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
        )
        : null  // no mostrar si no se puede regresar (hacer Pop)
    );

    // Armar el AppBar
    return AppBar(
      title: Text(
        appBarName,
        style: TextStyle(
            fontWeight:FontWeight.bold,
            fontSize:24,
            color: Colors.white
        ),
      ),
      centerTitle: true,
      backgroundColor: UltraColors.primary,
      elevation: 4,
      shadowColor: Colors.green,

      // Mostrar o no el leading dependiendo del contexto
      // de navegación (si puede hacer Pop)
      leading: returnNav,
    );
  }
}
