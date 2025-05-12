import 'package:flutter/material.dart';

class CustomTopBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final double height;

  const CustomTopBar({
    super.key,
    this.backgroundColor = const Color(0xFF009E3D),
    this.height = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Image.asset(
        'assets/icons/logo.png',
        height: 36,
        color: backgroundColor == Colors.white ? const Color(0xFF20763A) : Colors.white,
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
