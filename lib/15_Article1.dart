import 'package:final_finesse/10_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';

class Article1 extends StatelessWidget {
  const Article1({super.key});

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
                    "Tips and Articles",
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
                        'assets/img/food.jpg',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 30),
                          child: Text(
                            "Combining Food and\nExercise for Optimal Health",
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
                            "The combination of a healthy diet and regular exercise creates a powerful synergy for maintaining overall well-being."
                            " Food provides the energy and nutrients needed to fuel your workouts,"
                            " while exercise enhances your body’s ability to utilize these nutrients effectively."
                            " For optimal results, it’s important to align your diet with your fitness goals."
                            " Before a workout, a small meal or snack rich in carbohydrates can provide the necessary energy boost. "
                            " After exercise, focus on protein-rich foods to aid muscle recovery and repair."
                            "\n\n"
                            "Consistency in both diet and exercise is crucial for achieving and sustaining health benefits."
                            " Pairing whole foods like lean proteins, whole grains, and fresh produce with a"
                            "fitness regimen tailored to your needs can significantly improve your physical "
                            "performance and overall vitality. Timing your meals around your workouts also"
                            " plays a role in maximizing your energy levels and recovery process. "
                            "Staying hydrated before, during, and after exercise is essential for preventing"
                            "fatigue and maintaining endurance. By embracing the harmonious relationship between food and"
                            "exercise, you’re empowering yourself to lead a healthier, more balanced lifestyle.",
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
