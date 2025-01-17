import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // For Firebase Authentication
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoInfoTry extends StatefulWidget {
  const VideoInfoTry({Key? key}) : super(key: key);

  @override
  _VideoInfoTryState createState() => _VideoInfoTryState();
}

class _VideoInfoTryState extends State<VideoInfoTry> {
  final List<String> videoUrls = [];
  final List<YoutubePlayerController> _controllers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      // Get the current user's UID from Firebase Authentication
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception("User not logged in");
      }
      final uid = currentUser.uid;

      // Fetch data from Firestore using the user's UID
      final document = await FirebaseFirestore.instance
          .collection('user_medicalQuest')
          .doc(uid)
          .get();

      if (document.exists) {
        final data = document.data();
        final healthCondition = data?['healthConditions']; // Singular value

        // Map health condition to recommended videos
        final recommendedVideos = getRecommendedVideos(healthCondition);

        // Update video URLs and controllers
        setState(() {
          videoUrls.addAll(recommendedVideos);
          _controllers.addAll(recommendedVideos.map((url) {
            final videoID = YoutubePlayer.convertUrlToId(url);
            return YoutubePlayerController(
              initialVideoId: videoID!,
              flags: const YoutubePlayerFlags(autoPlay: false),
            );
          }));
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  List<String> getRecommendedVideos(String? healthCondition) {
    // Example mapping of health conditions to YouTube video URLs
    final recommendations = {
      'Joint Pain': [
        'https://www.youtube.com/watch?v=3qyWpJ34dWw',
        'https://www.youtube.com/watch?v=AnYl6Nk9GOA',
      ],
      'Back Pain': [
        'https://www.youtube.com/watch?v=UItWltVZZmE',
        'https://www.youtube.com/watch?v=Eml2xnoLpYE',
      ],
      'None of the above': [
        'https://www.youtube.com/watch?v=3qyWpJ34dWw',
        'https://www.youtube.com/watch?v=kZDvg92tTMc',
      ],
      'Heart Disease': [
        'https://www.youtube.com/watch?v=3qyWpJ34dWw',
        'https://www.youtube.com/watch?v=AnYl6Nk9GOA',
      ],
    };

    // Return videos for the given condition, or an empty list if condition not found
    return recommendations[healthCondition] ?? [];
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF896CFE).withOpacity(0.9),
                    const Color(0xFF1E1E1E).withOpacity(0.6),
                  ],
                  begin: const FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                ),
              ),
              child: Column(
                children: [
                  // Top Section
                  Container(
                    padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                           const Text(
                          "Cardio Workout",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                            const Spacer(),
                            const Icon(Icons.info_outline, size: 25, color: Colors.white),
                          ],                         
                        ),
                      ],
                    ),
                  ),
                  // Video List Section
                  Expanded(
                    child: Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      child: videoUrls.isEmpty
                          ? const Center(
                              child: Text(
                                "No videos found for your health condition.",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : ListView.builder(
                              itemCount: _controllers.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: YoutubePlayer(
                                    controller: _controllers[index],
                                    showVideoProgressIndicator: true,
                                    progressIndicatorColor: Colors.red,
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}