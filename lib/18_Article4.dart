import 'package:final_finesse/10_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Article4 extends StatelessWidget {
  const Article4 ({super.key});

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
                            "The Role of Regular Exercise in\nMaintaining Health",
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
                            "Regular exercise is a cornerstone of a healthy lifestyle, offering both physical and mental benefits. Engaging in physical activity strengthens your muscles, improves cardiovascular health, and helps maintain a healthy weight. Whether you prefer brisk walking, cycling, swimming, or yoga, consistency is key to reaping the benefits of exercise. Aim for at least 150 minutes of moderate aerobic activity or 75 minutes of vigorous activity per week, as recommended by health experts."
                            "\n\n"
                            "Exercise is also a powerful stress reliever. Physical activity prompts the release of endorphins, which elevate your mood and reduce feelings of anxiety. Combining aerobic exercises with strength training not only enhances your overall fitness but also builds bone density and prevents muscle loss as you age. To keep your routine engaging, try incorporating variety by exploring new activities or joining group classes. Setting achievable fitness goals and tracking your progress can help you stay motivated and make exercise an enjoyable part of your daily routine. By prioritizing physical activity, you’re investing in a stronger, healthier, and more resilient version of yourself.",
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
