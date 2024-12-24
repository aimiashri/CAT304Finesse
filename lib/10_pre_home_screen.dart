import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class preHomeScreen extends StatelessWidget {
  const preHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(children: [
              Text("Training",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 20,
              color: Color(0xFF896CFE),
              fontWeight: FontWeight.bold,
            ),
            ),

            Expanded(child: Container()),
            Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.white),
            SizedBox(width:10),
            Icon(Icons.calendar_today_outlined,
            size: 20,
            color: Colors.white),
            SizedBox(width:15),
            Icon(Icons.arrow_forward_ios,
            size: 20,
            color: Colors.white),
            ],),
            SizedBox(height: 30,),
            Row(children: [
              Text("Your Program",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 15,
              color: Color(0xFF896CFE),
              fontWeight: FontWeight.bold,
            ),
            ),
            Expanded(child: Container()),
              Text("Details",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 15,
              color: Color(0xFF896CFE),
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(width:5),
            Icon(Icons.arrow_forward_ios,
            size: 20,
            color: Colors.white),
            ],),
            SizedBox(height:20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFFB3A0FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
