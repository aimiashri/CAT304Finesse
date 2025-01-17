class VideoRecommender {
  // Map health conditions to YouTube video URLs
  static const Map<String, String> conditionToVideo = {
    "Diabetes": "https://www.youtube.com/watch?v=diabetes_workout_video",
    "High Blood Pressure": "https://www.youtube.com/watch?v=hypertension_workout_video",
    "Obesity": "https://www.youtube.com/watch?v=obesity_workout_video",
  };

  // Recommend videos based on health conditions
  static List<String> recommendVideos(List<String> healthConditions) {
    return healthConditions
        .where((condition) => conditionToVideo.containsKey(condition))
        .map((condition) => conditionToVideo[condition]!)
        .toList();
  }
}
