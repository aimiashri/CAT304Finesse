<<<<<<< HEAD
import 'package:final_finesse/10_home_screen.dart';
import 'package:final_finesse/21_cycling_challenge.dart';
import 'package:final_finesse/22_yoga_challenge.dart';
import 'package:final_finesse/23_leg_challenge.dart';
import 'package:final_finesse/25_groupChat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Challenges extends StatefulWidget {
  const Challenges({super.key});

  @override
  _ChallengesState createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
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
                          Get.to(() => HomeScreen());
                        },
                        child: Icon(Icons.arrow_back_ios,
                            size: 20, color: Colors.white)),
                    Text(
                      "Community",
                      style: TextStyle(
                        color: Color(0xFF896CFE),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 5),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Container(
                        height: 30,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Color(0xFF896CFE),
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
                                "Challenges",
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 35),
                      child: Container(
                        height: 30,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => groupChat());
                              },
                              child: Text(
                                "Group Chat",
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
                    )
                  ],
                ),

  
                SizedBox(height: 50),
                Text(
                  "Weekly Challenges",
                  style: TextStyle(
                    color: Color(0xFF896CFE),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => Cycling()); //video link
                        },
                        child: Container(
                          height: 96,
                          width: 360,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('assets/img/cycling_challenge.png'),
                              alignment: Alignment.centerRight,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 120),
                                child: Text(
                                  "Indoor Cycling Challenge",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 150),
                                child: Text(
                                  "Boost endurance with a fun,",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 152),
                                child: Text(
                                  "cardio-based bike workout",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => Yoga()); //video link
                        },
                        child: Container(
                          height: 96,
                          width: 360,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('assets/img/yoga_challenge.png'),
                              alignment: Alignment.centerRight,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 170),
                                child: Text(
                                  "Yoga Flow Balance",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 150),
                                child: Text(
                                  "Improve flexibility and focus",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 183),
                                child: Text(
                                  "with timed yoga poses",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => Leg()); //video link
                        },
                        child: Container(
                          height: 96,
                          width: 360,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('assets/img/leg_challenge.png'),
                              alignment: Alignment.centerRight,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 172),
                                child: Text(
                                  "Press Leg Ultimate",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 150),
                                child: Text(
                                  "Build leg strength with high-",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 162),
                                child: Text(
                                  "intensity press challenges",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              
              SizedBox(height: 50),
              Text(
                  "Click on any challenge to start !",
                  style: TextStyle(
                    color: Color(0xFFE2F163),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
=======
import 'package:final_finesse/10_home_screen.dart';
import 'package:final_finesse/21_cycling_challenge.dart';
import 'package:final_finesse/22_yoga_challenge.dart';
import 'package:final_finesse/23_leg_challenge.dart';
import 'package:final_finesse/25_groupChat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Challenges extends StatefulWidget {
  const Challenges({super.key});

  @override
  _ChallengesState createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
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
                          Get.to(() => HomeScreen());
                        },
                        child: Icon(Icons.arrow_back_ios,
                            size: 20, color: Colors.white)),
                    Text(
                      "Community",
                      style: TextStyle(
                        color: Color(0xFF896CFE),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 5),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Container(
                        height: 30,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Color(0xFF896CFE),
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
                                "Challenges",
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 35),
                      child: Container(
                        height: 30,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => groupChat());
                              },
                              child: Text(
                                "Group Chat",
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
                    )
                  ],
                ),

  
                SizedBox(height: 50),
                Text(
                  "Weekly Challenges",
                  style: TextStyle(
                    color: Color(0xFF896CFE),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => Cycling()); //video link
                        },
                        child: Container(
                          height: 96,
                          width: 360,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('assets/img/cycling_challenge.png'),
                              alignment: Alignment.centerRight,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 120),
                                child: Text(
                                  "Indoor Cycling Challenge",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 150),
                                child: Text(
                                  "Boost endurance with a fun,",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 152),
                                child: Text(
                                  "cardio-based bike workout",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => Yoga()); //video link
                        },
                        child: Container(
                          height: 96,
                          width: 360,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('assets/img/yoga_challenge.png'),
                              alignment: Alignment.centerRight,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 170),
                                child: Text(
                                  "Yoga Flow Balance",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 150),
                                child: Text(
                                  "Improve flexibility and focus",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 183),
                                child: Text(
                                  "with timed yoga poses",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => Leg()); //video link
                        },
                        child: Container(
                          height: 96,
                          width: 360,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('assets/img/leg_challenge.png'),
                              alignment: Alignment.centerRight,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 172),
                                child: Text(
                                  "Press Leg Ultimate",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 150),
                                child: Text(
                                  "Build leg strength with high-",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 162),
                                child: Text(
                                  "intensity press challenges",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              
              SizedBox(height: 50),
              Text(
                  "Click on any challenge to start !",
                  style: TextStyle(
                    color: Color(0xFFE2F163),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
>>>>>>> 3cd8a783bcb9ae90760361b6c57941f6065ee388
