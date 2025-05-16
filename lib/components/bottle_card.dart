import 'package:flutter/material.dart';
import 'package:pixelfield_flutter/app_utils/app_colors.dart';
import 'package:pixelfield_flutter/app_utils/custom_styling.dart';
import '../../data/models/bottle_model.dart';
import '../pages/bottle_details_screen.dart';

class BottleCard extends StatelessWidget {
  final Bottle bottle;
  const BottleCard({super.key, required this.bottle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BottleDetailsScreen(bottle: bottle,),
        ),
      ),
      child: Card(
        elevation: 0.5,
        color: AppColors.primaryColor.withOpacity(0.9),
        shadowColor: AppColors.textColor1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  bottle.image,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bottle.name , style: CustomStyling
                      .titleLabel),
                  Text("${bottle.year} #${bottle.caskNumber.toString()}", style:
                  CustomStyling
                      .titleLabel),
                  const SizedBox(height: 4),
                  Text("(${bottle.bottleNumber.toString()}/${bottle.total
                      .toString()})",
                      style:
                  CustomStyling
                      .bodyText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}