import 'package:animai/Onboarding/onboardingitems.dart';
import 'package:animai/Pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen ({super.key});

  @override
  State<Onboardingscreen> createState() => _State();
}

class _State extends State<Onboardingscreen> {

  final controller = Onboardingitems();
  final pageController = PageController();

  bool isLastPage=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: isLastPage? basla(context) : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            //Geçme tuşu
            TextButton(onPressed: ()=>pageController.jumpToPage(controller.items.length-1),
                child: Text("Geç")),

            //İndikatör
            SmoothPageIndicator(
                controller: pageController,
                count: controller.items.length,
            effect: WormEffect(
              activeDotColor: Colors.brown
            ),
            ),


            //Sonraki tuşu
            TextButton(onPressed: ()=>pageController.nextPage(duration: const Duration(milliseconds: 700), curve: Curves.easeIn),
                child: Text("Sıradaki"))

          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
          onPageChanged: (index)=> setState(()=>isLastPage = controller.items.length-1 == index ),
          itemCount: controller.items.length,
            controller: pageController,
            itemBuilder:(context,index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(controller.items[index].image),
                const SizedBox(height: 15),
                Text(controller.items[index].title,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                const SizedBox(height: 15),
                Text(controller.items[index].descriptions,style: const TextStyle(color: Colors.grey, fontSize: 17), textAlign: TextAlign.center,),


              ],
            );

            }),
      )
    );
  }
}

// Başlayalım tuşu

Widget basla(BuildContext context){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: const Color(0xff7f3711),
    ),
    width: 300,
    height: 55,
    child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Text("Başlayalım!", style: TextStyle(color: Colors.white),)),
  );
}


