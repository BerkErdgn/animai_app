import 'package:animai/Onboarding/onboardingscreen.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:animai/consts/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Gemini.init(apiKey: geminiAPIKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const Onboardingscreen(),
    );
  }
}


