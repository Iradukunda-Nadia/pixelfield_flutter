import 'package:flutter/material.dart';
import 'package:pixelfield_flutter/app_utils/app_colors.dart';
import 'package:pixelfield_flutter/app_utils/custom_styling.dart';
import 'base_loader.dart';

class BaseButton extends StatefulWidget {
  void Function()? onPressed;
  final bool? isLoading;
  final bool? isDisabled;
  final String? buttonText;
  final double? fSize;
  final Color? color;

  BaseButton({Key? key, this.onPressed, this.isLoading,
    this.buttonText, this.isDisabled, this.fSize, this.color}) : super(key: key);

  @override
  _BaseButtonState createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        elevation: 0,
        padding: widget.fSize != null?
        const EdgeInsets.symmetric(horizontal: 10, vertical: 12)
            :const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        textColor: AppColors.inputText,
        color: AppColors.primaryColor2,
        onPressed: widget.isDisabled== true ? (){}: widget.onPressed!,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
        child: widget.isLoading != true?
        Text(
          widget.buttonText!,
          style: CustomStyling.buttonLarge
        ):
        BaseLoader(isPrimary: true,),
      ),
    );
  }
}