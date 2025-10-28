import 'package:flutter/material.dart';

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
      backgroundColor: Color(0xFF0F9D58),
      elevation: 4,
      shadowColor: Colors.green,
    );
  }
}
