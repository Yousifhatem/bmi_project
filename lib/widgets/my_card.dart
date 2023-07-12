import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key, this.child, this.color, this.onPressed});

  final Widget? child;
  final Color? color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ),
      ),
    );
  }
}
