import 'package:final_finesse/11_activityLog.dart';
import 'package:final_finesse/14_ViewVouchers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class RedeemPoints extends StatefulWidget {
  const RedeemPoints({super.key});

  @override
  _RedeemPointsState createState() => _RedeemPointsState();
}

class _RedeemPointsState extends State<RedeemPoints> {
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
                          Get.to(() => ActivityLog());
                        },
                        child: Icon(Icons.arrow_back_ios,
                            size: 20, color: Colors.white)),
                    Text(
                      "Points Redemption",
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => ActivityLog());
                              },
                              child: Text(
                                "Workout Log",
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
                          color: Color(0xFF896CFE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Points",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Color(0xFFB3A0FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Points",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.flash_circle,
                                  size: 50,
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "530 pts",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Vouchers Available",
                  style: TextStyle(
                    color: Color(0xFF896CFE),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => ViewVoucher());
                        },
                        child: Container(
                          height: 130,
                          width: 360,
                          decoration: BoxDecoration(
                            color: Color(0xFFE2F163),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('assets/img/zus.png'),
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 60),
                                child: Text(
                                  "Zus Coffee",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 70),
                                child: Text(
                                  "10% Off Frappe Series",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 280, top: 20),
                                child: Text(
                                  "500pts",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color:
                                        const Color.fromARGB(255, 101, 95, 95),
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Stack(
                    children: [
                      Container(
                        height: 130,
                        width: 360,
                        decoration: BoxDecoration(
                          color: Color(0xFFE2F163),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/img/aeon.png'),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 60),
                              child: Text(
                                "AEON Mall",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 70),
                              child: Text(
                                "20% Off Total Bill",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 280, top: 20),
                              child: Text(
                                "700pts",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: const Color.fromARGB(255, 101, 95, 95),
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
                // Container(
                //   child: Stack(
                //     children: [
                //       Container(
                //         height: 130,
                //         width: 360,
                //         decoration: BoxDecoration(
                //           color: Color(0xFFE2F163),
                //           borderRadius: BorderRadius.circular(10),
                //           image: DecorationImage(
                //             image: AssetImage('assets/img/zus.png'),
                //             alignment: Alignment.centerLeft,
                //           ),
                //         ),
                //         child: Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.only(top: 30, left: 60),
                //               child: Text(
                //                 "Zus Coffee",
                //                 style: TextStyle(
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(left: 70),
                //               child: Text(
                //                 "10% Off Frappe Series",
                //                 style: TextStyle(
                //                   fontSize: 15,
                //                 ),
                //               ),
                //             ),
                //             Padding(
                //               padding:
                //                   const EdgeInsets.only(left: 280, top: 20),
                //               child: Text(
                //                 "500pts",
                //                 style: TextStyle(
                //                   fontSize: 11,
                //                   color: const Color.fromARGB(255, 101, 95, 95),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}
