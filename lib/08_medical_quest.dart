import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_finesse/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '06_personalise_quest_pg.dart';
import '08.1_medical_quest_2.dart';

class MedicalQuestionnairePage extends StatefulWidget {
  @override
  _MedicalQuestionnairePageState createState() => _MedicalQuestionnairePageState();
}

class _MedicalQuestionnairePageState extends State<MedicalQuestionnairePage> {
  
  // Variables to hold user's responses
  String healthConditions = '';
  // List<String> healthConditions = [
  //   'High blood pressure',
  //   'Heart disease',
  //   'Diabetes',
  //   'Asthma or breathing issues',
  //   'Joint pain or arthritis',
  //   'Back pain',
  //   'Others',
  //   'None of the above',
  // ];
  String otherHealthCondition = '';
  // List<String> selectedConditions = [];
  bool? hasChestPain;
  bool? hasHeartCondition ;
  bool? hasOtherMedicalCondition;
  String otherMedicalCondition = '';
  bool? hasInjuries;
  String injuryDetails = '';
  bool? hasMobilityIssues;
  String mobilityDetails = '';
  String healthStatus = '';
  String fatigueFrequency = '';
  bool? hasTestedRecently;
  String testDetails = '';
  bool? hasShortnessOfBreath;

  // final TextEditingController _otherHealthConditionController = TextEditingController();
  //final TextEditingController _otherHealthConditionController = TextEditingController();
  final TextEditingController _injuryDetailsController = TextEditingController();
  final TextEditingController _mobilityDetailsController = TextEditingController();
  final TextEditingController _otherMedicalConditionController = TextEditingController();
  final TextEditingController _testDetailsController = TextEditingController();

  final String? uid = FirebaseAuth.instance.currentUser?.uid;  // Replace with actual user ID from Firebase Auth

  late DatabaseService _databaseService;  // Use the actual user UID here

  @override
  void initState() {
    super.initState();
    _databaseService = DatabaseService(uid: uid);  // Initialize _databaseService here
  }

  // Function to save the data
  Future<void> saveMedicalData() async {
    try {
      await _databaseService.saveMedicalData(
        healthConditions: healthConditions, // Safely joining the list
        // otherHealthCondition: _otherHealthConditionController.text,
        hasChestPain: hasChestPain ?? false,
        hasHeartCondition: hasHeartCondition ?? false,
        hasOtherMedicalCondition: hasOtherMedicalCondition ?? false,
        otherMedicalCondition: _otherMedicalConditionController.text,
        hasInjuries: hasInjuries ?? false,
        injuryDetails: _injuryDetailsController.text,
        hasMobilityIssues: hasMobilityIssues ?? false,
        mobilityDetails: _mobilityDetailsController.text,
        healthStatus: healthStatus,
        fatigueFrequency: fatigueFrequency,
        hasTestedRecently: hasTestedRecently ?? false,
        testDetails: _testDetailsController.text,
        hasShortnessOfBreath: hasShortnessOfBreath ?? false,
      );

      // Optionally, you can navigate to the next page after saving the data
      print("Medical data saved successfully.");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MedicalQuestionnairePage2(),
        ),
      );
    } catch (e) {
      print("Error saving medical data: $e");
    }
  }

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonaliseQuestionsPage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    '< Medical Questionnaire',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Color(0xFF896CFE),
                      fontWeight: FontWeight.bold,
                    ),
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
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Wrap(
                        spacing: 10.0, // Add spacing between chips
                        children: [
                          ChoiceChip(
                            label: const Text(
                              'Joint Pain',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            selected: healthConditions == 'Joint Pain',
                            onSelected: (isSelected) {
                              setState(() {
                                healthConditions = (isSelected ? 'Joint Pain' : null)!;
                              });
                            },
                            selectedColor: Color(0xFF896CFE),  // Selected chip color
                            backgroundColor: Colors.white, // Unselected chip color
                          ),
                          ChoiceChip(
                            label: const Text(
                              'Heart Disease',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            selected: healthConditions == 'Heart Disease',
                            onSelected: (isSelected) {
                              setState(() {
                                healthConditions = (isSelected ? 'Heart Disease' : null)!;
                              });
                            },
                            selectedColor: Color(0xFF896CFE),
                            backgroundColor: Colors.white,
                          ),
                          ChoiceChip(
                            label: const Text(
                              'Back Pain',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            selected: healthConditions == 'Back Pain',
                            onSelected: (isSelected) {
                              setState(() {
                                healthConditions = (isSelected ? 'Back Pain' : null)!;
                              });
                            },
                            selectedColor: Color(0xFF896CFE),
                            backgroundColor: Colors.white,
                          ),
                          ChoiceChip(
                            label: const Text(
                              'None of the above',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            selected: healthConditions == 'None of the above',
                            onSelected: (isSelected) {
                              setState(() {
                                healthConditions = (isSelected ? 'None of the above' : null)!;
                              });
                            },
                            selectedColor: Color(0xFF896CFE),
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                      // children: healthConditions.map((condition) {
                      //   return ChoiceChip(
                      //     label: Text(
                      //       condition,
                      //       style: TextStyle(
                      //         fontSize: 12,
                      //         color: selectedConditions.contains(condition)
                      //             ? Colors.white
                      //             : Colors.black,
                      //       ),
                      //     ),
                      //     selected: selectedConditions.contains(condition),
                      //     onSelected: (isSelected) {
                      //       setState(() {
                      //         if (condition == 'None of the above' && isSelected) {
                      //           // Clear all selections and only select "None of the above"
                      //           selectedConditions.clear();
                      //           selectedConditions.add('None of the above');
                      //         } else if (condition != 'None of the above') {
                      //           // If any other condition is selected, unselect "None of the above"
                      //           selectedConditions.remove('None of the above');
                      //           if (isSelected) {
                      //             selectedConditions.add(condition);
                      //           } else {
                      //             selectedConditions.remove(condition);
                      //           }
                      //         }
                      //       });
                      //     },
                      //     selectedColor: Color(0xFF896CFE),  // Selected chip color
                      //     backgroundColor: Colors.white,    // Unselected chip color
                      //   );
                      // }).toList(),
                    // ),
                    // if (selectedConditions.contains('Others'))
                    //   Padding(
                    //     padding: const EdgeInsets.only(top: 10.0),
                    //     child: TextField(
                    //       controller: _otherHealthConditionController,
                    //       decoration: const InputDecoration(
                    //         labelText: 'Specify health issue',
                    //         labelStyle: TextStyle(color: Colors.white),
                    //       ),
                    //       style: const TextStyle(color: Colors.white),
                    //     ),
                    //   ),
                      const SizedBox(height: 20),
                      const Text(
                        'Have you ever experienced chest pain during physical activity?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
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
                              groupValue: hasChestPain,
                              onChanged: (value) {
                                setState(() {
                                  hasChestPain = value;
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
                              groupValue: hasChestPain,
                              onChanged: (value) {
                                setState(() {
                                  hasChestPain = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      const Text(
                        'Have you ever been diagnosed with any heart-related conditions by a doctor?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
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
                              groupValue: hasHeartCondition,
                              onChanged: (value) {
                                setState(() {
                                  hasHeartCondition = value;
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
                              groupValue: hasHeartCondition,
                              onChanged: (value) {
                                setState(() {
                                  hasHeartCondition = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      const Text(
                        'Do you have any other medical conditions that we should know about?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
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
                              groupValue: hasOtherMedicalCondition,
                              onChanged: (value) {
                                setState(() {
                                  hasOtherMedicalCondition = value!;
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
                              groupValue: hasOtherMedicalCondition,
                              onChanged: (value) {
                                setState(() {
                                  hasOtherMedicalCondition = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      if (hasOtherMedicalCondition != null && hasOtherMedicalCondition == true)
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextField(
                            controller: _otherMedicalConditionController,
                            decoration: const InputDecoration(
                              labelText: 'Specify other medical conditions',
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
                          fontSize: 14,
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
                                  hasInjuries = value;
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
                                  hasInjuries = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      if (hasInjuries != null && hasInjuries == true)
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextField(
                            controller: _injuryDetailsController,
                            decoration: const InputDecoration(
                              labelText: 'Specify injury details (e.g., knee, back)',
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),

                      const SizedBox(height: 20),
                      const Text(
                        'Do you have any mobility issues or limitations in movement?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
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
                              groupValue: hasMobilityIssues,
                              onChanged: (value) {
                                setState(() {
                                  hasMobilityIssues = value!;
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
                              groupValue: hasMobilityIssues,
                              onChanged: (value) {
                                setState(() {
                                  hasMobilityIssues = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      if (hasMobilityIssues != null && hasMobilityIssues == true)
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextField(
                            controller: _mobilityDetailsController,
                            decoration: const InputDecoration(
                              labelText: 'Specify mobility issues',
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),

                      const SizedBox(height: 20),
                      const Text(
                        'How would you describe your current health?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Wrap(
                        spacing: 10.0, // Add spacing between chips
                        children: [
                          ChoiceChip(
                            label: const Text(
                              'Excellent',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            selected: healthStatus == 'Excellent',
                            onSelected: (isSelected) {
                              setState(() {
                                healthStatus = (isSelected ? 'Excellent' : null)!;
                              });
                            },
                            selectedColor: Color(0xFF896CFE),  // Selected chip color
                            backgroundColor: Colors.white, // Unselected chip color
                          ),
                          ChoiceChip(
                            label: const Text(
                              'Good',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            selected: healthStatus == 'Good',
                            onSelected: (isSelected) {
                              setState(() {
                                healthStatus = (isSelected ? 'Good' : null)!;
                              });
                            },
                            selectedColor: Color(0xFF896CFE),
                            backgroundColor: Colors.white,
                          ),
                          ChoiceChip(
                            label: const Text(
                              'Fair',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            selected: healthStatus == 'Fair',
                            onSelected: (isSelected) {
                              setState(() {
                                healthStatus = (isSelected ? 'Fair' : null)!;
                              });
                            },
                            selectedColor: Color(0xFF896CFE),
                            backgroundColor: Colors.white,
                          ),
                          ChoiceChip(
                            label: const Text(
                              'Poor',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            selected: healthStatus == 'Poor',
                            onSelected: (isSelected) {
                              setState(() {
                                healthStatus = (isSelected ? 'Poor' : null)!;
                              });
                            },
                            selectedColor: Color(0xFF896CFE),
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 20),
                      const Text(
                        'Do you experience shortness of breath during mild activities like walking or climbing stairs?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
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
                              groupValue: hasShortnessOfBreath,
                              onChanged: (value) {
                                setState(() {
                                  hasShortnessOfBreath = value;
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
                              groupValue: hasShortnessOfBreath,
                              onChanged: (value) {
                                setState(() {
                                  hasShortnessOfBreath = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      const Text(
                        'How often do you feel fatigued during the day?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Wrap(
                        spacing: 10.0, // Add spacing between chips
                        children: [
                          ChoiceChip(
                            label: const Text(
                              'Rarely',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            selected: fatigueFrequency == 'Rarely',
                            onSelected: (isSelected) {
                              setState(() {
                                fatigueFrequency = (isSelected ? 'Rarely' : null)!;
                              });
                            },
                            selectedColor: Color(0xFF896CFE),
                            backgroundColor: Colors.white,
                          ),
                          ChoiceChip(
                            label: const Text(
                              'Occasionally',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            selected: fatigueFrequency == 'Occasionally',
                            onSelected: (isSelected) {
                              setState(() {
                                fatigueFrequency = (isSelected ? 'Occasionally' : null)!;
                              });
                            },
                            selectedColor: Color(0xFF896CFE),
                            backgroundColor: Colors.white,
                          ),
                          ChoiceChip(
                            label: const Text(
                              'Frequently',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            selected: fatigueFrequency == 'Frequently',
                            onSelected: (isSelected) {
                              setState(() {
                                fatigueFrequency = (isSelected ? 'Frequently' : null)!;
                              });
                            },
                            selectedColor: Color(0xFF896CFE),
                            backgroundColor: Colors.white,
                          ),
                          ChoiceChip(
                            label: const Text(
                              'Always',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            selected: fatigueFrequency == 'Always',
                            onSelected: (isSelected) {
                              setState(() {
                                fatigueFrequency = (isSelected ? 'Always' : null)!;
                              });
                            },
                            selectedColor: Color(0xFF896CFE),
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      const Text(
                        'Have you undergone any medical tests or received any diagnoses recently?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
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
                              groupValue: hasTestedRecently,
                              onChanged: (value) {
                                setState(() {
                                  hasTestedRecently = value;
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
                              groupValue: hasTestedRecently,
                              onChanged: (value) {
                                setState(() {
                                  hasTestedRecently = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      if (hasTestedRecently != null && hasTestedRecently == true)
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextField(
                            controller: _testDetailsController,
                            decoration: const InputDecoration(
                              labelText: 'Provide test details',
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
                            onPressed: () async {
                              saveMedicalData();  // Call to save medical data to Firestore
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