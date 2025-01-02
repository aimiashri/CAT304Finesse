<<<<<<< HEAD
import 'package:flutter/material.dart';
import '05_personalise_intro_pg.dart';
import '07_scanmedReport.dart'; // Import the MedicalReportScanPage

class PersonaliseQuestionsPage extends StatefulWidget {
  @override
  _PersonaliseQuestionsPageState createState() => _PersonaliseQuestionsPageState();
}

class _PersonaliseQuestionsPageState extends State<PersonaliseQuestionsPage> {
  String? _selectedGoal;
  String? _selectedWorkout;
  String? _selectedActivityLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width, // Ensure full width
        height: MediaQuery.of(context).size.height,
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
                      builder: (context) => PersonaliseIntroPage(), // Replace with actual page
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
              SizedBox(height: 50),
              Text(
                'What is Your Goal?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedGoal,
                dropdownColor: Color(0xFF1E1E1E),
                style: TextStyle(color: Colors.white),
                items: [
                  'Lose Weight',
                  'Gain Weight',
                  'Muscle Mass Gain',
                  'Shape Body',
                  'Others'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedGoal = newValue;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'What is Your Preferred Workout?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedWorkout,
                dropdownColor: Color(0xFF1E1E1E),
                style: TextStyle(color: Colors.white),
                items: [
                  'Yoga',
                  'Pilates',
                  'Balance Exercises',
                  'Cardio',
                  'Others'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedWorkout = newValue;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Physical Activity Level',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedActivityLevel,
                dropdownColor: Color(0xFF1E1E1E),
                style: TextStyle(color: Colors.white),
                items: [
                  'Beginner',
                  'Intermediate',
                  'Advanced'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedActivityLevel = newValue;
                  });
                },
              ),
              SizedBox(height: 60), // Spacing before the button
              Center(
                child: Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white, // Button background color
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MedicalReportScanPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                        fontSize: 16, // Slightly smaller font size
                        color: Colors.black, // Font color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
=======
import 'package:flutter/material.dart';
import '05_personalise_intro_pg.dart';
import '07_scanmedReport.dart'; // Import the MedicalReportScanPage

class PersonaliseQuestionsPage extends StatefulWidget {
  @override
  _PersonaliseQuestionsPageState createState() => _PersonaliseQuestionsPageState();
}

class _PersonaliseQuestionsPageState extends State<PersonaliseQuestionsPage> {
  String? _selectedGoal;
  String? _selectedWorkout;
  String? _selectedActivityLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width, // Ensure full width
        height: MediaQuery.of(context).size.height,
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
                      builder: (context) => PersonaliseIntroPage(), // Replace with actual page
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
              SizedBox(height: 50),
              Text(
                'What is Your Goal?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedGoal,
                dropdownColor: Color(0xFF1E1E1E),
                style: TextStyle(color: Colors.white),
                items: [
                  'Lose Weight',
                  'Gain Weight',
                  'Muscle Mass Gain',
                  'Shape Body',
                  'Others'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedGoal = newValue;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'What is Your Preferred Workout?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedWorkout,
                dropdownColor: Color(0xFF1E1E1E),
                style: TextStyle(color: Colors.white),
                items: [
                  'Yoga',
                  'Pilates',
                  'Balance Exercises',
                  'Cardio',
                  'Others'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedWorkout = newValue;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Physical Activity Level',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedActivityLevel,
                dropdownColor: Color(0xFF1E1E1E),
                style: TextStyle(color: Colors.white),
                items: [
                  'Beginner',
                  'Intermediate',
                  'Advanced'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedActivityLevel = newValue;
                  });
                },
              ),
              SizedBox(height: 60), // Spacing before the button
              Center(
                child: Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white, // Button background color
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MedicalReportScanPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                        fontSize: 16, // Slightly smaller font size
                        color: Colors.black, // Font color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
>>>>>>> 58b01f1842ad0d7660f0611708c98c5e9cccf02f
}