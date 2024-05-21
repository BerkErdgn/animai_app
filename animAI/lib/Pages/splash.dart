import 'package:flutter/material.dart';
import 'package:animai/Onboarding/onboardingscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToOnboard();
  }
  navigateToOnboard()async{
    await Future.delayed(Duration(seconds: 2), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Onboardingscreen()));
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.brown,)

              ],
            )
        )

    );
  }
}
