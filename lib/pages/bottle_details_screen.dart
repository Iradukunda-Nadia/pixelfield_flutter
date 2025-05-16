import 'package:flutter/material.dart';
import 'package:pixelfield_flutter/app_utils/app_colors.dart';
import 'package:pixelfield_flutter/app_utils/custom_styling.dart';
import 'package:pixelfield_flutter/components/base_button.dart';
import 'package:pixelfield_flutter/components/wavy_bg.dart';
import '../../data/models/bottle_model.dart';

class BottleDetailsScreen extends StatelessWidget {
  final Bottle bottle;
  const BottleDetailsScreen({super.key, required this.bottle});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: WavyBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Image.asset(
                      bottle.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Bottle ${bottle.bottleNumber}/${bottle.total}',
                          style: CustomStyling.bodySmall
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${bottle.name} ',
                              style: CustomStyling.headlineLarge,),
                            TextSpan(
                              text: '${bottle.age} Year old',
                              style: CustomStyling.headlineLarge2,
                            ),
                          ],
                        ),
                      ),
                      Text(
                          '# ${bottle.caskNumber}',
                          style: CustomStyling.headlineLarge
                      ),
                      const SizedBox(height: 12,),
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.inputText,
                        ),
                        child: TabBar(
                          labelPadding: const EdgeInsets.symmetric(
                              horizontal: 10),
                          labelStyle: CustomStyling.bodySmall,
                          indicator: BoxDecoration(
                            color: AppColors.primaryColor2,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          labelColor: Colors.black,
                          unselectedLabelColor: AppColors.textColor1,
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: const [
                            Tab(text: 'Details'),
                            Tab(text: 'Tasting notes'),
                            Tab(text: 'History'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  RowText(label: 'Distillery', value: bottle
                                      .distillery??''),
                                  RowText(label: 'Region', value: bottle
                                      .region),
                                  RowText(label: 'Country', value: bottle.country),
                                  RowText(label: 'Type', value: bottle.type),
                                  RowText(label: 'Age statement', value: bottle
                                      .age.toString()),
                                  RowText(label: 'filled', value: bottle
                                      .filled),
                                  const RowText(label: 'Bottled', value: 'yes'),
                                  RowText(label: 'Cask number', value: bottle
                                      .caskNumber.toString()),
                                  RowText(label: 'ABV', value: bottle
                                      .abv),
                                  RowText(label: 'size', value: bottle
                                      .size),
                                  RowText(label: 'finish', value: bottle
                                      .finish),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: bottle.flavours.map((f) => Text('• $f', style: const TextStyle(color: Colors.white))).toList(),
                              ),
                            ),
                            SingleChildScrollView(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                bottle.history,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: BaseButton(
                          buttonText: "+  Add to collection",
                          onPressed: (){},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RowText extends StatelessWidget {
  final String label;
  final String? value;
  const RowText({super.key, required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: CustomStyling.bodySmall),
          Text(value == null|| value == ""? "text": value!, style: CustomStyling.bodySmall),
        ],
      ),
    );
  }
}