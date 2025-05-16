import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixelfield_flutter/app_utils/app_colors.dart';
import 'package:pixelfield_flutter/app_utils/custom_styling.dart';
import 'package:pixelfield_flutter/components/base_button.dart';
import 'package:pixelfield_flutter/components/t_button.dart';
import 'package:pixelfield_flutter/pages/signup_screen.dart';

import '../components/wavy_bg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.inputText,
      body: WavyBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // No Spacer() needed — IntrinsicHeight + mainAxisAlignment handles it
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24,
                            horizontal: 16),
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Welcome!",
                                  style: CustomStyling.headlineLarge,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Text text text",
                                  style: CustomStyling.bodyText,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                BaseButton(
                                  buttonText: "Scan bottle",
                                  isLoading: false,
                                  onPressed: () {},
                                  fSize: 14,
                                ),
                                const SizedBox(height: 12),
                                TButton(
                                  text: "Have an account?",
                                  buttonT: "Sign in first",
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      CupertinoPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) => const SignUp(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );

  }
}
