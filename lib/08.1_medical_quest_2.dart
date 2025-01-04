import 'package:flutter/material.dart';
import '08_medical_quest.dart';

class MedicalQuestionnairePage2 extends StatefulWidget {
  @override
  _MedicalQuestionnairePage2State createState() => _MedicalQuestionnairePage2State();
}

class _MedicalQuestionnairePage2State extends State<MedicalQuestionnairePage2> {
  final TextEditingController _medicationDetailsController = TextEditingController();

  bool? advisedToAvoidPhysicalActivity; // Change to bool?
  bool? takingMedications; 
  bool? experiencedDizziness; 
  bool? confirmAccuracy; 
  bool? giveConsent;

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
                      builder: (context) => MedicalQuestionnairePage(),
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
                        'Have you been advised by a doctor to avoid physical activity?',
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
                              groupValue: advisedToAvoidPhysicalActivity,
                              onChanged: (value) {
                                setState(() {
                                  advisedToAvoidPhysicalActivity = value;
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
                              groupValue: advisedToAvoidPhysicalActivity,
                              onChanged: (value) {
                                setState(() {
                                  advisedToAvoidPhysicalActivity = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Are you currently taking any medications that may affect your ability to exercise?',
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
                              groupValue: takingMedications,
                              onChanged: (value) {
                                setState(() {
                                  takingMedications = value;
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
                              groupValue: takingMedications,
                              onChanged: (value) {
                                setState(() {
                                  takingMedications = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      if (takingMedications != null && takingMedications == true)
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextField(
                            controller: _medicationDetailsController,
                            decoration: const InputDecoration(
                              labelText: 'Please specify the medication(s)',
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      const SizedBox(height: 20),
                      const Text(
                        'Have you experienced dizziness or fainting during exercise?',
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
                              groupValue: experiencedDizziness,
                              onChanged: (value) {
                                setState(() {
                                  experiencedDizziness = value;
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
                              groupValue: experiencedDizziness,
                              onChanged: (value) {
                                setState(() {
                                  experiencedDizziness = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Do you confirm that all the information provided above is accurate to the best of your knowledge?',
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
                              groupValue: confirmAccuracy,
                              onChanged: (value) {
                                setState(() {
                                  confirmAccuracy = value;
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
                              groupValue: confirmAccuracy,
                              onChanged: (value) {
                                setState(() {
                                  confirmAccuracy = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Do you give consent to use this information to generate your personalized workout plan?',
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
                              groupValue: giveConsent,
                              onChanged: (value) {
                                setState(() {
                                  giveConsent = value;
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
                              groupValue: giveConsent,
                              onChanged: (value) {
                                setState(() {
                                  giveConsent = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                      Center(
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MedicalQuestionnairePage2(),
                                ),
                              );
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