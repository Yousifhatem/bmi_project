import 'package:flutter/material.dart';

class MyFloatingBtn extends StatelessWidget {
  const MyFloatingBtn(
      {super.key, required this.color, required this.icon, this.onPressed});

  final IconData icon;
  final Color color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(width: 56, height: 56),
      fillColor: color,
      onPressed: onPressed,
      shape: const CircleBorder(),
      elevation: 10,
      child: Icon(icon),
    );
  }
}
