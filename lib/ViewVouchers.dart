import 'package:final_finesse/redeemPoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewVoucher extends StatefulWidget {
  const ViewVoucher({super.key});

  @override
  _ViewVoucherState createState() => _ViewVoucherState();
}

class _ViewVoucherState extends State<ViewVoucher> {
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
                      Get.to(() => RedeemPoints());
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Vouchers",
                    style: TextStyle(
                      color: Color(0xFF896CFE),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
              SizedBox(height: 30),
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
                          image: AssetImage('assets/img/zus.png'),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 60),
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
                            padding: const EdgeInsets.only(left: 280, top: 20),
                            child: Text(
                              "500pts",
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
              SizedBox(height: 20),
              Container(
                child: Text(
                  "*Terms and Conditions Zus Coffee Voucher:\n"
                  " \n"
                  "1. One redemption per customer per transaction.\n"
                  " \n"
                  "2. Present this coupon at participating Zus Coffee\n"
                  "Outlets before payment is made and enjoy 10% Off\n"
                  "Frappe Series Beverages only.\n"
                  " \n"
                  "3. Valid at: All Zus Coffee Outlets in Malaysia (except\n"
                  "Genting Highlands, Sunway Lagoon, Johor Premium \n"
                  "Outlets, airport outlets in Malaysia).\n"
                  " \n"
                  "4. Promotion is valid while stocks last.\n"
                  " \n"
                  "5. Not valid with others vouchers, discounted items,\n"
                  "loyalty / privilege card and on-going-promotions.\n"
                  " \n"
                  "6. Voucher is valid within 6 months of redemption date.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Image(image: AssetImage("assets/img/barcode.png")),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFF896CFE),
                    ),
                    child: Center(
                      child: Text(
                        "Redeem Now",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
