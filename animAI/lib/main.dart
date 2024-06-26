import 'package:animai/Onboarding/onboardingscreen.dart';
import 'package:animai/Pages/cubit/addMyAnimalCubit.dart';

import 'package:animai/Pages/cubit/homePageCubit.dart';
import 'package:animai/Pages/cubit/petsPageCubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animai/Pages/splash.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:animai/consts/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Gemini.init(apiKey: geminiAPIKey);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomePageCubit()),
        BlocProvider(create: (context)=>PetsPageCubit()),
        BlocProvider(create: (context)=>AddMyAnimalCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
          useMaterial3: true,
        ),
        home: AnimatedSplashScreen(splash: 'assets/logo.png',
            splashIconSize:400,
            splashTransition: SplashTransition.rotationTransition,
            nextScreen: Onboardingscreen())
      ),
    );
  }
}


