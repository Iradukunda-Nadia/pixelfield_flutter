import 'package:flutter/material.dart';

import '../app_utils/custom_styling.dart';

class TButton extends StatelessWidget {
  final String text;
  final String buttonT;
  final Function () onPressed;

  const TButton({
    required this.text,
    required this.buttonT,
    required this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: CustomStyling.bodyText,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonT,
            style: CustomStyling.textButton,
          ),
        ),
      ],
    );
  }
}
