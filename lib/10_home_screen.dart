import 'dart:convert';
import 'package:final_finesse/11_activityLog.dart';
import 'package:final_finesse/12_videoInfoDUPE.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        info = jsonDecode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

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
                      "Abs Workout",
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
                              Get.to(() => VideoInfoDupe());
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
            Container(
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
                                    // Padding(
                                    //   padding: const EdgeInsets.only(left:140),
                                    //   child: Image(
                                    //     image: AssetImage("assets/img/plank.png"),
                                    //     alignment: Alignment.bottomRight,
                                    //     ),
                                    // )
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
            SizedBox(height: 15),
            Row(
              children: [
                Text("Area of Focus",
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
                child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                    itemCount: (info.length.toDouble() / 2).toInt(), //2
                    itemBuilder: (_, i) {
                      int a = 2 * i; //0, 2
                      int b = 2 * i + 1; //1, 3
                      return Row(
                        children: [
                          Container(
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              height: 130,
                              margin: EdgeInsets.only(
                                  left: 35, bottom: 15, top: 15),
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  color: Color(0xFF896CFE),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(info[a]['img'])),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(5, 5),
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(-5, -5),
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ]),
                              child: Center(
                                  child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(info[a]["title"],
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    )),
                              ))),
                          Container(
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              height: 130,
                              margin: EdgeInsets.only(
                                  left: 35, bottom: 15, top: 15),
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  color: Color(0xFF896CFE),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(info[b]['img'])),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(5, 5),
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(-5, -5),
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ]),
                              child: Center(
                                  child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(info[b]["title"],
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    )),
                              )))
                        ],
                      );
                    }),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
