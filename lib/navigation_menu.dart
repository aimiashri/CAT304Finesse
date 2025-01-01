import 'package:final_finesse/10_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: [
              const NavigationDestination(
                  icon: Icon(Iconsax.gift), label: "Rewards"),
              const NavigationDestination(
                  icon: Icon(Iconsax.people), label: "Community"),
              const NavigationDestination(
                  icon: Icon(Iconsax.home), label: "Home"),
              const NavigationDestination(
                  icon: Icon(Iconsax.search_normal), label: "Locator"),
              const NavigationDestination(
                  icon: Icon(Iconsax.profile_circle), label: "Profile"),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    Container(color: Colors.pink),
    Container(color: Colors.blue),
    Container(color: Colors.purple),
    Container(color: Colors.yellow),
  ];
}
