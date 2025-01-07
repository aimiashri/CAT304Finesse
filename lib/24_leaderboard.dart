import 'package:final_finesse/20_challenges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  late int ranking; // Variable to store the ranking

  @override
  void initState() {
    super.initState();
    // Generate a random number between 1 and 100 for the ranking
    ranking = Random().nextInt(10) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1E1E1E),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.to(() => Challenges());
                        },
                        child: Icon(Icons.arrow_back_ios,
                            size: 20, color: Colors.white)),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  child: Stack(
                    children: [
                      InkWell(
                        child: Container(
                          height: 300,
                          width: 450,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/img/trophy_challenge.png'),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  "Congratulations !",
                  style: TextStyle(
                    color: Color(0xFFE2F163),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "You are the ${ranking}${_getOrdinalSuffix(ranking)} person to complete this week's challenge",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFE2F163),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Container(
                        height: 50,
                        width: 360,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => Challenges());
                              },
                              child: Text(
                                "Go back to Challenges",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  // Helper function to get ordinal suffix for a number
  String _getOrdinalSuffix(int number) {
    if (number >= 11 && number <= 13) {
      return 'th';
    }
    switch (number % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
