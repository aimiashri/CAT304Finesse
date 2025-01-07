import 'package:final_finesse/20_challenges.dart';
import 'package:final_finesse/24_leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Cycling extends StatefulWidget {
  const Cycling({super.key});

  @override
  _CyclingState createState() => _CyclingState();
}

class _CyclingState extends State<Cycling> {
  bool _hasCompletedChallenge = false;

  void _showYouTubePlayer(String videoUrl) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);

    if (videoId == null) {
      // Show error if the URL is invalid
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid YouTube URL")),
      );
      return;
    }

    final controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: false,
      ),
    );

    setState(() {
    _hasCompletedChallenge = true; // Mark challenge as completed
    });

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            onReady: () {
              print("Player is ready");
            },
            onEnded: (metadata) {
              Navigator.pop(context); // Close the dialog when the video ends
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1E1E1E),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.to(() => Challenges());
                        },
                        child: Icon(Icons.arrow_back_ios,
                            size: 20, color: Colors.white)),
                    Text(
                      "Challenges",
                      style: TextStyle(
                        color: Color(0xFF896CFE),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  child: Stack(
                    children: [
                      InkWell(
                        child: Container(
                          height: 250,
                          width: 450,
                          decoration: BoxDecoration(
                            color: Color(0xFF896CFE),
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('assets/img/cycling_large.png'),
                              alignment: Alignment(0.0, -0.4),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 190, right: 80),
                                child: Text(
                                  "Indoor Cycling Challenge",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 3),
                              Padding(
                                padding: const EdgeInsets.only(right: 70),
                                child: Text(
                                  "• 40mins   • 500Kcal   • 5 Exercises",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          _showYouTubePlayer(
                              "https://youtu.be/TBvUjD5iYto?si=yLevdOcKgcyzudAM");
                        },
                        child: Container(
                          height: 60,
                          width: 360,
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              image: AssetImage('assets/img/play_icon.png'),
                              alignment: Alignment(-0.9, 0.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 70),
                                child: Text(
                                  "Endurance Ride",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  "15mins",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          _showYouTubePlayer(
                              "https://youtu.be/PKl09o_0Z3Y?si=2_vz_6ysEdPWNgMu");
                        },
                        child: Container(
                          height: 60,
                          width: 360,
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              image: AssetImage('assets/img/play_icon.png'),
                              alignment: Alignment(-0.9, 0.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 70),
                                child: Text(
                                  "Hill Climbs",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(
                                  "20mins",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          _showYouTubePlayer(
                              "https://youtu.be/JV2nqyGCaPE?si=BDilxZtkxcb7HRco");
                        },
                        child: Container(
                          height: 60,
                          width: 360,
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              image: AssetImage('assets/img/play_icon.png'),
                              alignment: Alignment(-0.9, 0.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 70),
                                child: Text(
                                  "Interval Sprints",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  "10mins",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Container(
                        height: 50,
                        width: 360,
                        decoration: BoxDecoration(
                          color: Color(0xFFE2F163),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                if (_hasCompletedChallenge) {
                                  Get.to(() => Leaderboard());
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Please complete any challenge first to view the leaderboard"),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                "View Leaderboard",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
