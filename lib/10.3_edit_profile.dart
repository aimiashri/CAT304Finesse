import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '10.1_user_acc_pg.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final uid = _auth.currentUser?.uid;
    if (uid != null) {
      final DocumentSnapshot snapshot =
          await _firestore.collection('user_profile').doc(uid).get();
      if (snapshot.exists) {
        setState(() {
          _fullNameController.text = snapshot['fullName'] ?? '';
          _nicknameController.text = snapshot['nickname'] ?? '';
          _emailController.text = snapshot['email'] ?? '';
          _regionController.text = snapshot['region'] ?? '';
          _phoneController.text = snapshot['phone'] ?? '';
        });
      }
    }
  }

  Future<void> _saveUserProfile() async {
    final uid = _auth.currentUser?.uid;
    if (uid != null) {
      await _firestore.collection('user_profile').doc(uid).set({
        'fullName': _fullNameController.text,
        'nickname': _nicknameController.text,
        'email': _emailController.text,
        'region': _regionController.text,
        'phone': _phoneController.text,
        'uid': uid,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18, color: Color(0xFF896CFE)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserAccountPage(),
              ),
            );
          },
        ),
        titleSpacing: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF896CFE),
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.black, // Page body background color is black
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildTextField('Full Name', _fullNameController),
            SizedBox(height: 10),
            _buildTextField('Nickname', _nicknameController),
            SizedBox(height: 10),
            _buildTextField('Email', _emailController),
            SizedBox(height: 10),
            _buildTextField('Region', _regionController),
            SizedBox(height: 10),
            _buildTextField('Phone Number', _phoneController),
            Spacer(),
            ElevatedButton(
              onPressed: _saveUserProfile,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Color(0xFF896CFE),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 20.0,
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFF896CFE),
          ),
          filled: true,
          fillColor: Colors.white10,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
