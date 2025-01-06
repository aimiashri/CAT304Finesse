import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_finesse/personal_trainer_detail.dart';

class TrainerInfo extends StatefulWidget {
  final String centerName;

  const TrainerInfo({super.key, required this.centerName});

  @override
  TrainerInfoState createState() => TrainerInfoState();
}

class TrainerInfoState extends State<TrainerInfo> {
  List<Trainer> getFilteredTrainers() {
    return trainers.where((trainer) => trainer.centerName == widget.centerName).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredTrainers = getFilteredTrainers();

    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Color(0xFFE2F163),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Trainer",
                  style: TextStyle(
                    color: Color(0xFFE2F163),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: filteredTrainers.length,
                itemBuilder: (context, index) {
                  final trainer = filteredTrainers[index];
                  return GestureDetector(
                    onDoubleTap: () {
                      Get.to(PersonalTrainerDetail(trainerName: trainer.name));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFF896CFE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(trainer.profilePic),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                trainer.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Session: ${trainer.sessionDuration}",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "Cost: ${trainer.cost}",
                                style: TextStyle(fontSize: 15),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.yellow, size: 15),
                                  SizedBox(width: 5),
                                  Text(
                                    "${trainer.rating}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Trainer {
  final String name;
  final String sessionDuration;
  final String cost;
  final double rating;
  final String profilePic;
  final String centerName;

  Trainer({
    required this.name,
    required this.sessionDuration,
    required this.cost,
    required this.rating,
    required this.profilePic,
    required this.centerName,
  });
}

final List<Trainer> trainers = [
  Trainer(
    name: "Dr.Azam",
    sessionDuration: "1 hour",
    cost: "RM50",
    rating: 5.0,
    profilePic: 'assets/img/trainer1.png',
    centerName: "USM Fitness Centre",
  ),
  Trainer(
    name: "Miss Haziqah",
    sessionDuration: "45 mins",
    cost: "RM40",
    rating: 5.0,
    profilePic: 'assets/img/trainer2.png',
    centerName: "USM Fitness Centre",
  ),
  Trainer(
    name: "Nana Wong",
    sessionDuration: "30 mins",
    cost: "RM30",
    rating: 3.5,
    profilePic: 'assets/img/trainer3.png',
    centerName: "Zender Fitness",
  )
];
