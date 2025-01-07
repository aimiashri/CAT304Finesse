import 'package:final_finesse/04_profile_fill.dart';
import 'package:final_finesse/05_personalise_intro_pg.dart';
import 'package:final_finesse/10.1_user_acc_pg.dart';
import 'package:final_finesse/10_home_screen.dart';
import 'package:final_finesse/13_redeemPoints.dart';
import 'package:final_finesse/20_challenges.dart';
import 'package:final_finesse/30_google_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '10.1_user_acc_pg.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return WillPopScope(
      onWillPop: () async {
        if (controller.selectedIndex.value != 2) {
          controller.selectedIndex.value = 2;
          controller.pageController.jumpToPage(2);
          return false;
        }
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) {
              controller.selectedIndex.value = index;
              controller.pageController.jumpToPage(index);
            },
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
            ],
          ),
        ),
        body: PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.selectedIndex.value = index;
          },
          children: controller.screens,
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 2);

  final screens = [
    const RedeemPoints(),
    const Challenges(),
    const HomeScreen(),
    const GoogleMapFlutter(),
    UserAccountPage(),
];
}
