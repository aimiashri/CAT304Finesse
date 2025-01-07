import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_finesse/30_google_map.dart';

class AppointmentDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: Image.asset(
                'assets/img/appointmentdone.png',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Appointment Done !',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            Spacer(),
            SizedBox(height: 10), // Add this line to move the button higher
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Get.to(() => GoogleMapFlutter());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: Size(350, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.0),
                ),
              ),
              child: Text('Go Back to Home'),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}