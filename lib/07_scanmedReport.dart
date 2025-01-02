import 'package:flutter/material.dart';
import '06_personalise_quest_pg.dart';
import '08_medical_quest.dart';

class MedicalReportScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1E1E1E),
              Color(0xFF896CFE),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonaliseQuestionsPage(),
                    ),
                  );
                },
                child: Text(
                  '< Personalisation',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Color(0xFF896CFE),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  'Scan Medical Report',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Scan your medical report or click the "No Medical Report?" button',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 400, // Increased width of the button
                      height: 60, // Increased height of the button
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Add scanning logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Reduced padding
                        ),
                        icon: Icon(
                          Icons.qr_code_scanner,
                          color: Color(0xFF896CFE),
                        ),
                        label: Text(
                          'Scan',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20, // Increased font size
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF896CFE),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // Align to the right
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MedicalQuestionnairePage()),
                            );
                          },
                          child: Text(
                            'No Medical Report?',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10), // Added spacing between buttons
                    TextButton(
                      onPressed: () {
                         // Navigate back to the home screen
                      },
                      child: Text(
                        'Go Back To Home',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}