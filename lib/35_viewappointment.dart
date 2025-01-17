import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewAppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Appointments',
          style:
              TextStyle(color: Color(0xFF896CFE), fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: _fetchAppointments(_auth, _firestore),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            if (!snapshot.hasData || (snapshot.data?.isEmpty ?? true)) {
              return Center(
                  child: Text("You do not have any appointments.",
                      style: TextStyle(color: Colors.white, fontSize: 18)));
            }

            var appointments = snapshot.data as List<Map<String, dynamic>>;
            return ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                var appointment = appointments[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  color: Color(0xFF1E1E1E),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10.0),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Trainer: ${appointment['trainer']}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Name: ${appointment['name']}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Email: ${appointment['email']}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Mobile number: ${appointment['mobile']}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Date: ${appointment['date']}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Time: ${appointment['time']}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Additional Notes (optional): ${appointment['notes']}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _fetchAppointments(
      FirebaseAuth _auth, FirebaseFirestore _firestore) async {
    final user = _auth.currentUser;
    if (user == null) {
      return [];
    }

    String userID = user.uid;
    String userEmail = user.email ?? "";

    final snapshot = await _firestore
        .collection('appointments')
        .where('userID', isEqualTo: userID)
        .where('userEmail', isEqualTo: userEmail)
        .get();

    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }
}
