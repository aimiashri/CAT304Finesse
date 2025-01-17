import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoInfoTry extends StatefulWidget {
  final String uid; // Pass the user's UID when navigating to this screen.

  const VideoInfoTry ({Key? key, required this.uid}) : super(key: key);

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
      // Fetch data from Firestore
      final doc = await FirebaseFirestore.instance
          .collection('user_medicalQuest')
          .doc(widget.uid)
          .get();

      if (doc.exists) {
        final data = doc.data();
        final healthConditions = data?['healthConditions'] as List<dynamic>? ?? [];

        // Map health conditions to recommended videos
        final recommendedVideos = getRecommendedVideos(healthConditions);

        // Update video URLs
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

  List<String> getRecommendedVideos(List<dynamic> healthConditions) {
    // Example mapping of health conditions to YouTube video URLs
    final recommendations = {
      'Joint Pain or arthritis': [
        'https://www.youtube.com/watch?v=3qyWpJ34dWw',
        'https://www.youtube.com/watch?v=AnYl6Nk9GOA',
      ],
      'None of the above': [
        'https://www.youtube.com/watch?v=UItWltVZZmE',
        'https://www.youtube.com/watch?v=50kH47ZztHs',
      ],
      'Diabetes': [
        'https://www.youtube.com/watch?v=v7AYKMP6rOE',
        'https://www.youtube.com/watch?v=qULTwquOuT4',
      ],
    };

    final recommendedVideos = <String>[];
    for (var condition in healthConditions) {
      if (recommendations.containsKey(condition)) {
        recommendedVideos.addAll(recommendations[condition]!);
      }
    }

    return recommendedVideos;
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
                            const Spacer(),
                            const Icon(Icons.info_outline, size: 25, color: Colors.white),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Recommended Workouts",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Video List Section
                  Expanded(
                    child: Container(
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
                                "No videos found for your health conditions.",
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
