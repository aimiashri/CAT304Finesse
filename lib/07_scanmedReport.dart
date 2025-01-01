import 'package:flutter/material.dart';
import '06_personalise_quest_pg.dart';

class MedicalReportScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF1E1E1E),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    fontSize: 18,
                    color: Color(0xFF896CFE),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Scan Medical Report',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Scan your medical report or click the "No Medical Report?" button',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Center(
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add scanning logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      icon: Icon(
                        Icons.qr_code_scanner,
                        color: Color(0xFF896CFE),
                      ),
                      label: Text(
                        'Scan',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF896CFE),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to the questionnaire page
                      },
                      child: Text(
                        'No Medical Report?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
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
