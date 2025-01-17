import 'dart:io';
// import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_finesse/02_loginScreen.dart';
import 'package:final_finesse/10_home_screen.dart';
import 'package:final_finesse/Services/authentication.dart';
import 'package:final_finesse/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '04_profile_fill.dart';
import '10.2_sub_plan_pg.dart';
import '00_WelcomeScreen.dart';
import '35_viewappointment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAccountPage extends StatefulWidget {
  @override
  _UserAccountPageState createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  String userNickname = "Nana"; // Placeholder until data is fetched
  String userBio = "This is my bio."; // Example data
  String? uid;

  @override
  void initState() {
    super.initState();
    _fetchUserNickname(); // Fetch nickname on page load
  }

  Future<void> _fetchUserNickname() async {
    try {
      // Get the current user's UID from FirebaseAuth
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final uid = user.uid; // Get the UID
        print("User ID: $uid");

        // Fetch user data from the Firestore collection
        DocumentSnapshot userProfileCollection = await FirebaseFirestore.instance
            .collection('user_profile')
            .doc(uid) // Use the UID here
            .get();

        if (userProfileCollection.exists) {
          print("User profile document exists");
          setState(() {
            userNickname = userProfileCollection['nickname'] ?? 'No nickname';
          });
        } else {
          print("User profile document does not exist");
          setState(() {
            userNickname = 'No nickname found';
          });
        }
      } else {
        print("User not logged in");
        setState(() {
          userNickname = 'User not logged in';
        });
      }
    } catch (e) {
      print("Error fetching nickname: $e");
      setState(() {
        userNickname = 'Error fetching nickname';
      });
    }
  }

  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF896CFE),
              Color(0xFF1E1E1E),
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: const Icon(Icons.arrow_back_ios,
                      size: 18, color: Colors.white),
                ),
                const SizedBox(width: 10),
                const Text(
                  "User Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () async {
                // Add profile picture
                final picture =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (picture != null) {
                  image = File(picture.path);
                  setState(() {});
                }
              },
              child: image == null
                  ? const CircleAvatar(
                      radius: 90,
                      child: Icon(
                        Icons.camera_alt,
                        size: 50,
                      ),
                    )
                  : ClipOval(
                      child: Image.file(
                      image!,
                      height: 110,
                      width: 110,
                      fit: BoxFit.cover,
                    )),
            ),
            const SizedBox(height: 15),
            Text(
              userNickname,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    userBio,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 0),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        TextEditingController bioController =
                            TextEditingController(text: userBio);
                        return AlertDialog(
                          title: const Text("Edit Bio"),
                          content: TextField(
                            controller: bioController,
                            decoration: const InputDecoration(
                                hintText: "Enter your bio"),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  userBio = bioController.text;
                                });
                                Navigator.pop(context);
                              },
                              child: const Text("Save"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.white),
                    title: const Text(
                      "Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Get.to(() =>
                          ProfilePage()); // Replace with actual navigation
                    },
                  ),
                  Divider(color: Colors.white, thickness: 0.5),
                  ListTile(
                    leading:
                        const Icon(Icons.subscriptions, color: Colors.white),
                    title: const Text(
                      "Subscription",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Get.to(() => SubscriptionPlanPage());
                    },
                  ),
                  Divider(color: Colors.white, thickness: 0.5),
                  ListTile(
                    leading:
                        const Icon(Icons.calendar_today, color: Colors.white),
                    title: const Text(
                      "Appointments",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Get.to(() =>
                          ViewAppointmentsPage()); // Navigate to ViewAppointmentsPage
                    },
                  ),
                  Divider(color: Colors.white, thickness: 0.5),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.white),
                    title: const Text(
                      "Log Out",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () async {
                      await AuthServices().signOut();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                      // Clear session data
                      // Example with SharedPreferences:
                      // final prefs = await SharedPreferences.getInstance();
                      // await prefs.clear();

                      // // Reset NavigationController state
                      // final navController = Get.find<NavigationController>();
                      // navController.selectedIndex.value =
                      //     2; // Default to 'Home'
                      // navController.pageController.jumpToPage(2);

                      // // Navigate to WelcomeScreen
                      // Get.offAll(() => WelcomeScreen());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
