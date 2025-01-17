import 'package:final_finesse/service/database_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '04_profile_fill.dart';
import '10.1_user_acc_pg.dart'; // Import the UserAccountPage class

class PersonalDetailsPage extends StatefulWidget {
  @override
  _PersonalDetailsPageState createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  String selectedGender = '';
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController raceController = TextEditingController();

  @override
  void dispose() {
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    raceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1E1E1E),
                Color(0xFF896CFE),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserAccountPage()),
            );
          },
          child: Row(
            children: const [
              Icon(Icons.arrow_back_ios, size:18, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Personal Details', 
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
              ),
            ],
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1E1E1E),
                  Color(0xFF896CFE),
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Personal Details\nTell us about yourself',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF896CFE),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Male',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value.toString();
                            });
                          },
                          activeColor: Color(0xFF896CFE),
                        ),
                        Text('Male'),
                        Radio(
                          value: 'Female',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value.toString();
                            });
                          },
                          activeColor: Color(0xFF896CFE),
                        ),
                        Text('Female'),
                      ],
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        labelStyle: TextStyle(
                          color: Color(0xFF896CFE),
                          fontWeight: FontWeight.bold,
                        ),
                        suffixIcon:
                            Icon(Icons.calendar_today, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF896CFE)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Weight (kg)',
                        labelStyle: TextStyle(
                          color: Color(0xFF896CFE),
                          fontWeight: FontWeight.bold,
                        ),
                        suffixIcon:
                            Icon(Icons.monitor_weight, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF896CFE)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Height (cm)',
                        labelStyle: TextStyle(
                          color: Color(0xFF896CFE),
                          fontWeight: FontWeight.bold,
                        ),
                        suffixIcon: Icon(Icons.height, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF896CFE)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: raceController,
                      decoration: InputDecoration(
                        labelText: 'Race',
                        labelStyle: TextStyle(
                          color: Color(0xFF896CFE),
                          fontWeight: FontWeight.bold,
                        ),
                        suffixIcon: Icon(Icons.person, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF896CFE)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 70),
                    Center(
                      child: Container(
                        height: 55,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF1E1E1E),
                              Color(0xFF896CFE),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              // Ensure you retrieve the UID from FirebaseAuth
                              String? uid = FirebaseAuth.instance.currentUser?.uid;

                              if (uid == null || uid.isEmpty) {
                                throw Exception("User is not logged in or UID is missing");
                              }

                              // Collect user inputs
                              String gender = selectedGender;
                              int age = int.parse(ageController.text);
                              double weight = double.parse(weightController.text);
                              double height = double.parse(heightController.text);
                              String race = raceController.text;

                              // Save personal details in Firebase
                              DatabaseService databaseService =
                                  DatabaseService(uid: uid); // Replace with actual user ID
                              await databaseService.savePersonalDetails(
                                  gender, age, weight, height, race);

                              // Link the personal details to the user's main document
                              await databaseService.linkPersonalDetails();

                              // Navigate to the next page
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()));
                            } catch (e) {
                              // Handle errors (e.g., show a snackbar)
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Failed to save details: $e")),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'SAVE',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
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
          ),
        ],
      ),
    );
  }
}
