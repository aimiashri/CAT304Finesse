import 'package:final_finesse/10_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Article2 extends StatelessWidget {
  const Article2 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Get.to(() => HomeScreen());
                      },
                      child: Icon(Icons.arrow_back_ios,
                          size: 20, color: Colors.white)),
                  Text(
                    "Articles and Tips",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF896CFE),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/img/busyeating.jpg',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 30),
                        child: Center(
                          child: Text(
                            "Healthy Eating on a\nBusy Schedule",
                            style: TextStyle(
                                color: Color(0xFFE2F163),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                height: 1.5),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 20),
                        child: Text(
                            "For many people, a busy schedule can make healthy eating seem like a daunting task. However, with a little planning and preparation, it’s entirely possible to maintain good nutrition even on the busiest of days. Meal prepping is an excellent strategy to ensure you have healthy options readily available. Dedicate a few hours each week to prepare and portion meals for the days ahead. Focus on simple, nutrient-dense recipes that include a mix of lean proteins, whole grains, and fresh vegetables."
                            "\n\n"
                            "Snacking smartly can also help you maintain energy levels throughout the day. Keep healthy snacks like nuts, seeds, fruit, or yogurt on hand to avoid the temptation of reaching for processed options. Drinking water regularly is equally important to stay hydrated and alert, especially if your schedule involves long hours at a desk or on the go. If eating out is unavoidable, opt for menu items that are grilled, baked, or steamed rather than fried. Small, mindful choices add up over time and can significantly impact your overall health. Remember, healthy eating doesn’t have to be complicated—a little effort goes a long way in ensuring your body gets the fuel it needs to thrive.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.justify),
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
