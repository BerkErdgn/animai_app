import 'package:animai/Pages/homepage.dart';
import 'package:animai/Pages/petspage.dart';
import 'package:animai/Pages/profilepage.dart';
import 'package:animai/Pages/geminipage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Anasayfa'),
              NavigationDestination(icon: Icon(CupertinoIcons.paw), label: 'Hayvanlarım'),
              NavigationDestination(icon: Icon(CupertinoIcons.keyboard_chevron_compact_down), label: 'AI'),
              NavigationDestination(icon: Icon(CupertinoIcons.profile_circled), label: 'Profile'),
        ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {

  final Rx<int> selectedIndex =0.obs;

  final screens = [const Homepage(),const Petspage(),const Geminipage(),Profilepage()];

}