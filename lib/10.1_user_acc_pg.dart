import 'package:final_finesse/10_home_screen.dart';
import 'package:final_finesse/14_ViewVouchers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '04_profile_fill.dart';
import '10.2_sub_plan_pg.dart';

class UserAccountPage extends StatefulWidget {
  @override
  _UserAccountPageState createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  String userNickname = "JohnDoe"; // Example data
  String userBio = "This is my bio."; // Example data

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
                  child: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
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
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/default_profile.png'), // Replace with your asset
                  backgroundColor: Colors.grey,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      // Add logic to edit the profile picture
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Color(0xFF896CFE),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
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
                        TextEditingController bioController = TextEditingController(text: userBio);
                        return AlertDialog(
                          title: const Text("Edit Bio"),
                          content: TextField(
                            controller: bioController,
                            decoration: const InputDecoration(hintText: "Enter your bio"),
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
                      Get.to(() => ProfilePage()); // Replace with actual navigation
                    },
                  ),

                  Divider(color: Colors.white, thickness: 0.5),
                  ListTile(
                    leading: const Icon(Icons.subscriptions, color: Colors.white),
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
                    leading: const Icon(Icons.card_giftcard, color: Colors.white),
                    title: const Text(
                      "Vouchers",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Get.to(() => ViewVoucher());
                    },
                  ),

                  Divider(color: Colors.white, thickness: 0.5),
                  ListTile(
                    leading: const Icon(Icons.flag, color: Colors.white),
                    title: const Text(
                      "Challenges",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Navigate to challenges page
                    },
                  ),

                  Divider(color: Colors.white, thickness: 0.5),
                  ListTile(
                    leading: const Icon(Icons.security, color: Colors.white),
                    title: const Text(
                      "Security",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Navigate to security page
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