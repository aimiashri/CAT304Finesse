import 'package:final_finesse/10_home_screen.dart';
import 'package:final_finesse/13_redeemPoints.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';

class ActivityLog extends StatefulWidget {
  const ActivityLog({super.key});

  @override
  _ActivityLogState createState() => _ActivityLogState();
}

class _ActivityLogState extends State<ActivityLog> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

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
                      "Progress Tracking",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF896CFE),
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(Icons.notifications_active_outlined,
                        size: 25, color: Colors.white),
                    SizedBox(height: 30),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 30),
                      child: Container(
                        height: 30,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Color(0xFFB3A0FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Workout Log",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 20),
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
                                Get.to(() => RedeemPoints());
                              },
                              child: Text(
                                "Points",
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
                SizedBox(height: 40),
                Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 5),
                    child: Column(
                      children: [
                        Container(
                          width: 400,
                          height: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFFE2F163),
                          ),
                          child: TableCalendar(
                            locale: "en_US",
                            rowHeight: 50,
                            headerStyle: HeaderStyle(
                                formatButtonVisible: false,
                                titleCentered: true),
                            availableGestures: AvailableGestures.all,
                            focusedDay: today,
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            onDaySelected: _onDaySelected,
                            selectedDayPredicate: (day) =>
                                isSameDay(day, today),
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 300),
                  child: Text(
                    "Activity",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF896CFE),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: 90,
                          width: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF896CFE),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Upper Body Workout",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: 90,
                          width: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF896CFE),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Pull Ups",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
