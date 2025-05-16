import 'package:flutter/material.dart';
import 'package:pixelfield_flutter/app_utils/app_colors.dart';
import 'package:pixelfield_flutter/app_utils/custom_styling.dart';
import 'package:pixelfield_flutter/components/base_button.dart';
import 'package:pixelfield_flutter/components/t_button.dart';
import 'package:pixelfield_flutter/pages/dashboard_screen.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Handle successful sign up
      print("Email: ${_emailController.text}");
      print("Password: ${_passwordController.text}");

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        ),
      );
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return "Enter a valid email";
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    if (value.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.inputText,
      appBar: AppBar(
        backgroundColor: AppColors.inputText,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textColor1),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Sign Up",
                  style: CustomStyling.headlineLarge
                ),
                const SizedBox(height: 40),
                // Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "email@email.com",
                    labelStyle: CustomStyling.labelText,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  validator: _validatePassword,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: CustomStyling.labelText,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: BaseButton(
                    onPressed: _submit,
                    buttonText: "Continue",
                    isLoading: false,
                  ),
                ),
                const SizedBox(height: 20),

                // Forgot password
                TButton(
                  text: "Can't sign in?",
                  buttonT: "recover password",
                  onPressed: (){},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}