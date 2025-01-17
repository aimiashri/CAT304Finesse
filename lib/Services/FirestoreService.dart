import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch health conditions based on UID
  Future<List<String>> fetchHealthConditions(String uid) async {
    try {
      // Reference to the user's medicalQuest sub-collection
      CollectionReference userMedicalQuest = _firestore
          .collection('users')
          .doc(uid)
          .collection('user_medicalQuest');

      QuerySnapshot querySnapshot = await userMedicalQuest.get();

      // Assuming only one document in user_medicalQuest (or adjust logic for multiple docs)
      if (querySnapshot.docs.isNotEmpty) {
        var healthConditions = querySnapshot.docs.first['healthConditions'];
        return List<String>.from(healthConditions); // Convert to List<String>
      } else {
        print('No medical data found for this user.');
        return [];
      }
    } catch (e) {
      print('Error fetching health conditions: $e');
      return [];
    }
  }
}


