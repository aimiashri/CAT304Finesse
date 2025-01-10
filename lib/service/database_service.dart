import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // reference for our collections
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");
  final CollectionReference personalDetailsCollection =
      FirebaseFirestore.instance.collection("user_personalDetails");
  final CollectionReference userMedicalQuestCollection =
      FirebaseFirestore.instance.collection("user_medicalQuest");

  // saving the userdata
  Future savingUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "groups": [],
      "uid": uid,
    });
  }

  // Saving personal details
  Future savePersonalDetails(String gender, int age, double weight, double height, String race) async {
    return await personalDetailsCollection.doc(uid).set({
      "gender": gender,
      "age": age,
      "weight": weight,
      "height": height,
      "race": race,
      "uid": uid, // Foreign key for linking with users
    });
  }

  // Link personal details to the user
  Future linkPersonalDetails() async {
    return await userCollection.doc(uid).update({
      "personalDetailsId": uid, // Linking by using the same document ID
    });
  }

  // getting user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  // Save user profile data
  Future saveUserProfile({
    required String fullName,
    required String nickname,
    required String email,
    required String region,
    required String phone,
  }) async {
    final CollectionReference userProfileCollection =
        FirebaseFirestore.instance.collection("user_profile");

    return await userProfileCollection.doc(uid).set({
      "fullName": fullName,
      "nickname": nickname,
      "email": email,
      "region": region,
      "phone": phone,
      "uid": uid,
    });
  }

  // Link user profile to the users collection
  Future linkUserProfile() async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference.update({
      "profileLinked": true,
      "profileId": uid, // Assuming profile ID matches UID
    });
  }

  // Save user personalization answers
  Future saveUserPersonalisation({
    required String goal,
    required String workout,
    required String activityLevel,
  }) async {
    final CollectionReference userPersonaliseQuestCollection =
        FirebaseFirestore.instance.collection("user_personaliseQuest");

    return await userPersonaliseQuestCollection.doc(uid).set({
      "goal": goal,
      "preferredWorkout": workout,
      "activityLevel": activityLevel,
      "uid": uid,
    });
  }

  // Link user personalization answers to the users collection
  Future linkUserPersonalisation() async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference.update({
      "personalisationLinked": true,
      "personalisationId": uid, // Assuming personalisation ID matches UID
    });
  }

  // saving medical questionnaire data
  Future saveMedicalData({
    required String healthConditions,
    required String otherHealthCondition,
    required bool hasChestPain,
    required bool hasHeartCondition,
    required bool hasOtherMedicalCondition,
    required String otherMedicalCondition,
    required bool hasInjuries,
    required String injuryDetails,
    required bool hasMobilityIssues,
    required String mobilityDetails,
    required String healthStatus,
    required String fatigueFrequency,
    required bool hasTestedRecently,
    required String testDetails,
    required bool hasShortnessOfBreath, 
  }) async {
    try {
      // Store medical questionnaire data in the 'user_medicalQuest' collection
      await userMedicalQuestCollection.doc(uid).set({
        "healthConditions": healthConditions,
        "otherHealthCondition": otherHealthCondition,
        "hasChestPain": hasChestPain,
        "hasHeartCondition": hasHeartCondition,
        "hasOtherMedicalCondition": hasOtherMedicalCondition,
        "otherMedicalCondition": otherMedicalCondition,
        "hasInjuries": hasInjuries,
        "injuryDetails": injuryDetails,
        "hasMobilityIssues": hasMobilityIssues,
        "mobilityDetails": mobilityDetails,
        "healthStatus": healthStatus,
        "fatigueFrequency": fatigueFrequency,
        "hasTestedRecently": hasTestedRecently,
        "testDetails": testDetails,
        "hasShortnessOfBreath": hasShortnessOfBreath,
        "uid": uid,
      });

      // Link the medical answers to the 'users' collection
      await linkMedicalAnswersToUser();

      print("Medical data saved and linked successfully.");
    } catch (e) {
      print("Error saving medical data: $e");
    }
  }

  Future<void> saveAdditionalMedicalData({
    required bool? advisedToAvoidPhysicalActivity,
    required bool? takingMedications,
    required String? medicationDetails,
    required bool? experiencedDizziness,
    required bool? confirmAccuracy,
    required bool? giveConsent,
  }) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid; // Ensure user is authenticated
      if (userId != null) {
        final data = {
          'advisedToAvoidPhysicalActivity': advisedToAvoidPhysicalActivity,
          'takingMedications': takingMedications,
          'medicationDetails': medicationDetails,
          'experiencedDizziness': experiencedDizziness,
          'confirmAccuracy': confirmAccuracy,
          'giveConsent': giveConsent,
          'timestamp': FieldValue.serverTimestamp(), // Add timestamp for record tracking
        };

        await FirebaseFirestore.instance
            .collection('user_medicalQuest')
            .doc(userId)
            .update(data); // Use `update` to append to the existing record
      }
    } catch (e) {
      print('Error saving additional medical data: $e');
    }
  }

  // Link medical answers to the 'users' collection
  Future linkMedicalAnswersToUser() async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference.update({
      "medicalAnswersLinked": true,
      "medicalAnswersId": uid, // Use the user UID as the medicalAnswersId
    });
  }

  // get user groups
  getUserGroups() async {
    return userCollection.doc(uid).snapshots();
  }

  // creating a group
  Future createGroup(String userName, String id, String groupName) async {
    DocumentReference groupDocumentReference = await groupCollection.add({
      "groupName": groupName,
      "groupIcon": "",
      "admin": "${id}_$userName",
      "members": [],
      "groupId": "",
      "recentMessage": "",
      "recentMessageSender": "",
    });
    // update the members
    await groupDocumentReference.update({
      "members": FieldValue.arrayUnion(["${uid}_$userName"]),
      "groupId": groupDocumentReference.id,
    });

    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference.update({
      "groups":
          FieldValue.arrayUnion(["${groupDocumentReference.id}_$groupName"])
    });
  }

  // getting the chats
  getChats(String groupId) async {
    return groupCollection
        .doc(groupId)
        .collection("messages")
        .orderBy("time")
        .snapshots();
  }

  Future getGroupAdmin(String groupId) async {
    DocumentReference d = groupCollection.doc(groupId);
    DocumentSnapshot documentSnapshot = await d.get();
    return documentSnapshot['admin'];
  }

  // get group members
  getGroupMembers(groupId) async {
    return groupCollection.doc(groupId).snapshots();
  }

  // search
  searchByName(String groupName) {
    return groupCollection.where("groupName", isEqualTo: groupName).get();
  }

  // function -> bool
  Future<bool> isUserJoined(
      String groupName, String groupId, String userName) async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentSnapshot documentSnapshot = await userDocumentReference.get();

    List<dynamic> groups = await documentSnapshot['groups'];
    if (groups.contains("${groupId}_$groupName")) {
      return true;
    } else {
      return false;
    }
  }

  // toggling the group join/exit
  Future toggleGroupJoin(
      String groupId, String userName, String groupName) async {
    // doc reference
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);

    DocumentSnapshot documentSnapshot = await userDocumentReference.get();
    List<dynamic> groups = await documentSnapshot['groups'];

    // if user has our groups -> then remove then or also in other part re join
    if (groups.contains("${groupId}_$groupName")) {
      await userDocumentReference.update({
        "groups": FieldValue.arrayRemove(["${groupId}_$groupName"])
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayRemove(["${uid}_$userName"])
      });
    } else {
      await userDocumentReference.update({
        "groups": FieldValue.arrayUnion(["${groupId}_$groupName"])
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayUnion(["${uid}_$userName"])
      });
    }
  }

  // send message
  sendMessage(String groupId, Map<String, dynamic> chatMessageData) async {
    groupCollection.doc(groupId).collection("messages").add(chatMessageData);
    groupCollection.doc(groupId).update({
      "recentMessage": chatMessageData['message'],
      "recentMessageSender": chatMessageData['sender'],
      "recentMessageTime": chatMessageData['time'].toString(),
    });
  }
}