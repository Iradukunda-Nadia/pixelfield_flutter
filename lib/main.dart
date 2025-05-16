import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_flutter/blocs/bottle/bottle_bloc.dart';
import 'package:pixelfield_flutter/components/wavy_bg.dart';
import 'package:pixelfield_flutter/pages/welcome_screen.dart';

import 'blocs/bottle/bottle_event.dart';
import 'data/repositories/bottle_repository.dart';

void main() {
  final bottleRepository = BottleRepository();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BottleBloc(bottleRepository)..add(LoadBottlesEvent()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WavyBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/one_cask_logo.png',
                width: 140.0,
                height: 140.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
