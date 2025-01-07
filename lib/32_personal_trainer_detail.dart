import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_finesse/33_fitness_appointmentbooking.dart';

class PersonalTrainerDetail extends StatefulWidget {
  final String trainerName;

  const PersonalTrainerDetail({super.key, required this.trainerName});

  @override
  _PersonalTrainerDetailState createState() => _PersonalTrainerDetailState();
}
class _PersonalTrainerDetailState extends State<PersonalTrainerDetail> {
  Map<String, Map<String, String>> trainerDetails = {
    "Dr. Azam": {
      "title": "Certified Personal Trainer | Nutrition Coach",
      "specialization": "Specializing in Body Recomposition",
      "description": "Hi! I’m Dr. Azam, a passionate certified personal trainer specializing in weight loss and muscle building. I am committed to helping you achieve your fitness goals. Together, we’ll make it!",
      "about": "I work with clients to create flexible schedules and provide personalized coaching in techniques, form, and diet-specific training.",
      "review": "Perfect! Exceptional personal trainer - highly recommended. His consultation was thorough, and insightful.",
      "rating": "5.0",
      "rate": "RM50/session",
      "image": "assets/img/trainer1.png"
    },
    "Miss Haziqah": {
      "title": "Certified Strength Coach | Functional Training Specialist",
      "specialization": "Specializing in Posture Improvement and Injury Recovery",
      "description": "Hi there! I’m Miss Haziqah, a strength coach specializing in functional training and injury recovery. My goal is to help you build strength, improve posture, and recover safely.",
      "about": "I develop structured programs focusing on building core strength and enhancing functional movement. I work with clients to rebuild confidence and regain mobility after injuries.",
      "review": "Nana is outstanding! Her personalized strength training sessions are effective and motivating. She helped me recover quickly and regain my strength.",
      "rating": "5.0",
      "rate": "RM40/session",
      "image": "assets/img/trainer2.png"
    },
    "Nana Wong": {
      "title": "Certified Fitness Instructor | Cardio & Aerobics Trainer",
      "specialization": "Specializing in Aerobic Workouts and Endurance Building",
      "description": "Hi there! I’m Nana Wong, a group fitness instructor focusing on cardio and aerobics training. My sessions aim to make fitness enjoyable while improving stamina and overall health.",
      "about": "I lead engaging group classes tailored for beginners and intermediate fitness enthusiasts. My approach emphasizes consistency, fun, and maintaining an active lifestyle to achieve long-term results.",
      "review": "Nana’s group classes are energetic, but they might not be as personalized as some would prefer. Still, a good choice for cardio lovers!",
      "rating": "3.5",
      "rate": "RM30/session",
      "image": "assets/img/trainer3.png"
    },
  };

  @override
  Widget build(BuildContext context) {
    final trainerInfo = trainerDetails[widget.trainerName] ?? trainerDetails.values.first;

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button and title
              Row(
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Color(0xFFE2F163),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Appointment",
                    style: TextStyle(
                      color: Color(0xFFE2F163),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Profile Section
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(trainerInfo["image"]!),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.trainerName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      trainerInfo["title"]!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      trainerInfo["specialization"]!,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // About Me Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "About Me",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      trainerInfo["description"]!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      trainerInfo["about"]!,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              

              // Reviews Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Review",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(width: 5),
                        Text(
                          trainerInfo["rating"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                        "Cost: ${trainerInfo["rate"]!}",
                        style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      trainerInfo["review"]!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Book Appointment Button
              Center(
                child: InkWell(
                  onTap: () {
                    // Navigate to booking page
                    Get.to(FitnessAppointmentBooking(trainerName: widget.trainerName));
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF896CFE),
                    ),
                    child: const Center(
                      child: Text(
                        "Book Appointment",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
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

// import 'package:final_finesse/fitness_appointmentbooking.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class PersonalTrainerDetail extends StatefulWidget {
//   final String trainerName;

//   const PersonalTrainerDetail({super.key, required this.trainerName});

//   @override
//   _PersonalTrainerDetailState createState() => _PersonalTrainerDetailState();
// }

// class _PersonalTrainerDetailState extends State<PersonalTrainerDetail> {
//   Map<String, Map<String, String>> trainerDetails = {
//     "John Doe": {
//       "title": "Certified Personal Trainer",
//       "experience": "5 years experience",
//       "description": "John Doe is a certified personal trainer with over 5 years of experience in helping clients achieve their fitness goals. He specializes in weight loss, muscle gain, and overall fitness improvement.",
//       "image": "assets/img/plank.png",
//       "certImage": "assets/img/plank.png"
//     },
//     "Jane Smith": {
//       "title": "Senior Fitness Coach",
//       "experience": "8 years experience",
//       "description": "Jane Smith is a senior fitness coach with over 8 years of experience. She specializes in strength training, cardio workouts, and nutrition planning.",
//       "image": "assets/img/plank.png",
//       "certImage": "assets/img/plank.png"
//     },
//     "Mike Johnson": {
//       "title": "Senior Fitness Coach",
//       "experience": "8 years experience",
//       "description": "Jane Smith is a senior fitness coach with over 8 years of experience. She specializes in strength training, cardio workouts, and nutrition planning.",
//       "image": "assets/img/plank.png",
//       "certImage": "assets/img/plank.png"
//     }
//   };

//   @override
//   Widget build(BuildContext context) {
//     final trainerInfo = trainerDetails[widget.trainerName] ?? trainerDetails["John Doe"]!;

//     return Scaffold(
//       backgroundColor: Color(0xFF1E1E1E),
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Get.back();
//                     },
//                     child: Icon(
//                       Icons.arrow_back_ios,
//                       size: 20,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     "Personal Trainer",
//                     style: TextStyle(
//                       color: Color(0xFF896CFE),
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                 ],
//               ),
//               SizedBox(height: 30),
//               Container(
//                 child: Stack(
//                   children: [
//                     Container(
//                       height: 130,
//                       width: 360,
//                       decoration: BoxDecoration(
//                         color: Color(0xFFE2F163),
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(
//                           image: AssetImage(trainerInfo["image"]!),
//                           alignment: Alignment.centerLeft,
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 30, left: 60),
//                             child: Text(
//                               widget.trainerName,
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 70),
//                             child: Text(
//                               trainerInfo["title"]!,
//                               style: TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 280, top: 20),
//                             child: Text(
//                               trainerInfo["experience"]!,
//                               style: TextStyle(
//                                 fontSize: 11,
//                                 color: const Color.fromARGB(255, 101, 95, 95),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 child: Text(
//                   trainerInfo["description"]!,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 child: Image(image: AssetImage(trainerInfo["certImage"]!)),
//               ),
//               SizedBox(height: 20),
//               Column(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Get.to(FitnessAppointmentBooking(trainerName: widget.trainerName));
//                     },
//                     child: Container(
//                       height: 50,
//                       width: 180,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: Color(0xFF896CFE),
//                       ),
//                       child: Center(
//                         child: Text(
//                           "Book Appointment",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }