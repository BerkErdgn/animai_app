import 'package:animai/Onboarding/onboardingscreen.dart';
<<<<<<< HEAD
import 'package:animai/Pages/cubit/homePageCubit.dart';
import 'package:animai/Pages/cubit/petsPageCubit.dart';
import 'package:firebase_core/firebase_core.dart';
=======
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:animai/consts/constant.dart';
>>>>>>> 9336b7df14e001ea461e2adc2b7e5740e6f18e06
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

<<<<<<< HEAD
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
=======
void main() {
  Gemini.init(apiKey: geminiAPIKey);
>>>>>>> 9336b7df14e001ea461e2adc2b7e5740e6f18e06
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
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
          useMaterial3: true,
        ),
        home: const Onboardingscreen(),
      ),
    );
  }
}


