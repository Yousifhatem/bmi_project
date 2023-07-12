import 'package:bmi_project/constants.dart';
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({super.key, required this.buttonText, required this.onTap});
  String buttonText;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        margin: const EdgeInsets.only(top: 15),
        width: double.infinity,
        height: kBottomContainerHeight,
        decoration: const BoxDecoration(
          color: kBottomContainerColour,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
