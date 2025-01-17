import 'package:final_finesse/11_activityLog.dart';
import 'package:final_finesse/12_videoInfoDUPE.dart';
import 'package:final_finesse/15_Article1.dart';
import 'package:final_finesse/16_Article2.dart';
import 'package:final_finesse/17_Article3.dart';
import 'package:final_finesse/18_Article4.dart';
import 'package:final_finesse/20_challenges.dart';
import 'package:final_finesse/VideoInfoTry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> items = [
    {
      'title': 'Getting Optimal Health',
      'imageUrl':
          'assets/img/food.jpg',
    },
    {
      'title': 'Busy Schedule Eating',
      'imageUrl':
          'assets/img/busyeating.jpg',
    },
    {
      'title': 'Balanced Nutrition',
      'imageUrl':
          'assets/img/balanced.jpg',
    },
    {
      'title': 'Role of Regular Exercise',
      'imageUrl':
          'assets/img/exercise.webp',
    },
  ];

  List<String> title= [
    'Healthy Eating',
    'Morning Yoga',
    'Cardio Workout',
    'Hydration Tips',
  ];

  List<Widget> route = [
    Article1(),
    Article2(),
    Article3(),
    Article4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    color: Color(0xFF896CFE),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: Container()),
                InkWell(
                    onTap: () {
                      Get.to(() => HomeScreen());
                    },
                    child: Icon(Icons.arrow_back_ios,
                        size: 20, color: Colors.white)),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Get.to(() => ActivityLog());
                  },
                  child: Icon(Icons.calendar_today_outlined,
                      size: 20, color: Colors.white),
                ),
                SizedBox(width: 15),
                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.white),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Your Program",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15,
                    color: Color(0xFF896CFE),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Details",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15,
                    color: Color(0xFF896CFE),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                InkWell(
                    onTap: () {
                      Get.to(() => VideoInfoDupe());
                    },
                    child: Icon(Icons.arrow_forward_ios,
                        size: 20, color: Colors.white)),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF896CFE).withOpacity(0.8),
                    Color(0xFFB3A0FF).withOpacity(0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 10),
                    blurRadius: 10,
                    color: Color(0xFFB3A0FF).withOpacity(0.2),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Next Workout",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Cardio Workout",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "25 mins",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 10,
                                    offset: Offset(4, 8))
                              ]),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => VideoInfoTry());
                            },
                            child: Icon(Icons.play_circle_fill,
                                color: Colors.white, size: 65),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => Challenges());
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 400,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 134, 144, 50),
                              Color(0xFFE2F163),
                            ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Weekly\nChallenge",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Plank with Hip Twist",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Text("Tips and Articles",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF896CFE),
                    ))
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => Article1());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 15),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: AssetImage(items[index]['imageUrl']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            items[index]['title']!,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
