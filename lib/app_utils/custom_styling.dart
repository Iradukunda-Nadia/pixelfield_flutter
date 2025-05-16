import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomStyling{

  static var headlineLarge = GoogleFonts.ebGaramond(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    color: AppColors.textColor1
  );
  static var headlineLarge2 = GoogleFonts.ebGaramond(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: AppColors.primaryColor2
  );
  static var titleLabel = GoogleFonts.ebGaramond(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: AppColors.textColor1
  );
  static var titleLabel2 = GoogleFonts.ebGaramond(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: AppColors.primaryColor2
  );
  static var bodyText = GoogleFonts.lato(
    color: AppColors.textColor1,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
  static var bodySmall = GoogleFonts.lato(
    color: AppColors.textColor1,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
  static var labelText = GoogleFonts.lato(
    color: AppColors.primaryColor2,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
  static var buttonLarge = GoogleFonts.ebGaramond(
    color: AppColors.inputText,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );
  static var textButton = GoogleFonts.lato(
    color: AppColors.primaryColor2,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

}