import 'package:final_finesse/service/database_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import '05_personalise_intro_pg.dart';
import '10.1_user_acc_pg.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _nameController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _emailController = TextEditingController();
  final _regionController = TextEditingController();
  final _phoneController = TextEditingController();

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
              Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
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
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1E1E1E),
                  Color(0xFF896CFE),
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 50.0, left: 5),
              child: Text(
                'Fill Profile\nComplete your profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 210.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(
                          color: Color(0xFF896CFE),
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: Icon(Icons.person_outline, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF896CFE)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _nicknameController,
                      decoration: InputDecoration(
                        labelText: 'Nickname',
                        labelStyle: TextStyle(
                          color: Color(0xFF896CFE),
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: Icon(Icons.face_outlined, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF896CFE)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Color(0xFF896CFE),
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF896CFE)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Region Field
                    TextField(
                      controller: _regionController,
                      decoration: InputDecoration(
                        labelText: 'Region',
                        labelStyle: TextStyle(
                          color: Color(0xFF896CFE),
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: Icon(Icons.home_outlined, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF896CFE)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                          color: Color(0xFF896CFE),
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: Icon(Icons.phone_outlined, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF896CFE)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    Container(
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
                            // Validate inputs
                            if (_nameController.text.isEmpty ||
                                _nicknameController.text.isEmpty ||
                                _emailController.text.isEmpty ||
                                _regionController.text.isEmpty ||
                                _phoneController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Please fill in all fields")),
                              );
                              return;
                            }

                            // Get the current user's UID
                            String? uid = FirebaseAuth.instance.currentUser?.uid;

                            if (uid == null || uid.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("User is not logged in")),
                              );
                              return;
                            }

                            // Instantiate the DatabaseService
                            DatabaseService databaseService = DatabaseService(uid: uid);

                            // Save user profile
                            await databaseService.saveUserProfile(
                              fullName: _nameController.text,
                              nickname: _nicknameController.text,
                              email: _emailController.text,
                              region: _regionController.text,
                              phone: _phoneController.text,
                            );

                            // Link the user profile to the users collection
                            await databaseService.linkUserProfile();

                            // Navigate to the next page or show confirmation
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PersonaliseIntroPage()),
                            );
                          } catch (e) {
                            // Handle errors (e.g., show a snackbar)
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Failed to save profile: $e")),
                            );
                          }
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
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