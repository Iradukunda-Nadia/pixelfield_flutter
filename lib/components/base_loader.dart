import 'package:flutter/material.dart';
import 'package:pixelfield_flutter/app_utils/app_colors.dart';

class BaseLoader extends StatelessWidget {
  final bool? isPrimary;
  final bool? isFetching;
  double? height;
  double? width;
  BaseLoader({Key? key, this.isPrimary, this.isFetching, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height?? 20,
      height: width?? 20,
      child: CircularProgressIndicator(
        strokeWidth: isFetching == true? 2:1.5,
        valueColor: AlwaysStoppedAnimation<Color>(
            isPrimary == true? AppColors.textColor1:
            isFetching == true? AppColors.primaryColor:
            AppColors.textColor1),
      ),
    );
  }
}