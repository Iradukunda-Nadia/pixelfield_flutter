import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_flutter/app_utils/app_colors.dart';
import 'package:pixelfield_flutter/app_utils/custom_styling.dart';
import '../../blocs/bottle/bottle_bloc.dart';
import '../../blocs/bottle/bottle_state.dart';
import '../components/bottle_card.dart';

class MyCollectionsScreen extends StatelessWidget {
  const MyCollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocBuilder<BottleBloc, BottleState>(
        builder: (context, state) {
          if (state is BottleLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BottleLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: state.bottles.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) => BottleCard(bottle: state.bottles[index]),
            );
          } else {
            return const Center(child: Text("Failed to load data"));
          }
        },
      ),
    );
  }
}
