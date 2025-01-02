import 'package:final_finesse/04_profile_fill.dart';
import 'package:final_finesse/05_personalise_intro_pg.dart';
import 'package:final_finesse/10_home_screen.dart';
import 'package:final_finesse/13_redeemPoints.dart';
import 'package:final_finesse/20_groupChat.dart';
import 'package:final_finesse/30_google_map.dart';
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
    const RedeemPoints(),
    const GroupChat(),
    const HomeScreen(),
    const GoogleMapFlutter(),
    ProfilePage(),
  ];
}
