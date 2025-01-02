import 'package:flutter/material.dart';

class MedicalQuestionnairePage extends StatefulWidget {
  @override
  _MedicalQuestionnairePageState createState() => _MedicalQuestionnairePageState();
}

class _MedicalQuestionnairePageState extends State<MedicalQuestionnairePage> {
  final List<String> healthConditions = [
    'High blood pressure',
    'Heart disease',
    'Diabetes',
    'Asthma or breathing issues',
    'Joint pain or arthritis',
    'Back pain',
    'Others',
    'None of the above',
  ];

  final TextEditingController _otherHealthConditionController = TextEditingController();
  final TextEditingController _injuryDetailsController = TextEditingController();
  final TextEditingController _dietaryDetailsController = TextEditingController();

  List<String> selectedHealthConditions = [];
  bool hasInjuries = false;
  bool hasDietaryRestrictions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '< Medical Questionnaire',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Color(0xFF896CFE),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Do you have any of the following health conditions?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10.0,
                        children: healthConditions.map((condition) {
                          return ChoiceChip(
                            label: Text(condition),
                            selected: selectedHealthConditions.contains(condition),
                            onSelected: (isSelected) {
                              setState(() {
                                if (condition == 'None of the above' && isSelected) {
                                  selectedHealthConditions.clear();
                                }
                                if (isSelected) {
                                  selectedHealthConditions.add(condition);
                                  if (condition == 'None of the above') {
                                    selectedHealthConditions = ['None of the above'];
                                  }
                                } else {
                                  selectedHealthConditions.remove(condition);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                      if (selectedHealthConditions.contains('Others (Specify health issue)'))
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextField(
                            controller: _otherHealthConditionController,
                            decoration: const InputDecoration(
                              labelText: 'Specify health issue',
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      const SizedBox(height: 20),
                      const Text(
                        'Have you experienced any injuries in the past year?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<bool>(
                              title: const Text(
                                'Yes',
                                style: TextStyle(color: Colors.white),
                              ),
                              value: true,
                              groupValue: hasInjuries,
                              onChanged: (value) {
                                setState(() {
                                  hasInjuries = value!;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<bool>(
                              title: const Text(
                                'No',
                                style: TextStyle(color: Colors.white),
                              ),
                              value: false,
                              groupValue: hasInjuries,
                              onChanged: (value) {
                                setState(() {
                                  hasInjuries = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      if (hasInjuries)
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextField(
                            controller: _injuryDetailsController,
                            decoration: const InputDecoration(
                              labelText: 'Specify type of injury',
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      const SizedBox(height: 20),
                      const Text(
                        'Do you have any dietary restrictions or special requirements?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<bool>(
                              title: const Text(
                                'Yes',
                                style: TextStyle(color: Colors.white),
                              ),
                              value: true,
                              groupValue: hasDietaryRestrictions,
                              onChanged: (value) {
                                setState(() {
                                  hasDietaryRestrictions = value!;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<bool>(
                              title: const Text(
                                'No',
                                style: TextStyle(color: Colors.white),
                              ),
                              value: false,
                              groupValue: hasDietaryRestrictions,
                              onChanged: (value) {
                                setState(() {
                                  hasDietaryRestrictions = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      if (hasDietaryRestrictions)
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextField(
                            controller: _dietaryDetailsController,
                            decoration: const InputDecoration(
                              labelText: 'Specify dietary restrictions',
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      const SizedBox(height: 30),
                      Center(
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/nextPage'); // Replace with actual next page route
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: const Text(
                              'CONTINUE',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Colors.black,
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
            ],
          ),
        ),
      ),
    );
  }
}