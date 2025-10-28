import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/styles/colors.dart';

class UltraAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarName;

  const UltraAppBar({super.key, required this.appBarName});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
