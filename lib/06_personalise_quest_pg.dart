import 'package:flutter/material.dart';

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
        color: Color(0xFF1E1E1E),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
