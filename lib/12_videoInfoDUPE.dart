import 'package:final_finesse/10_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:final_finesse/player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final videoUrls = [
  'https://www.youtube.com/watch?v=3qyWpJ34dWw',
  'https://www.youtube.com/watch?v=AnYl6Nk9GOA',
  // 'https://www.youtube.com/watch?v=JSqUZFkRLr8',
  // 'https://www.youtube.com/watch?v=qEZf2q4W20g',
  // 'https://www.youtube.com/watch?v=jCbclWBV32o'
];

class VideoInfoDupe extends StatefulWidget {
  const VideoInfoDupe({super.key});

  @override
  _VideoInfoDupeState createState() => _VideoInfoDupeState();
}

class _VideoInfoDupeState extends State<VideoInfoDupe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  Color(0xFF896CFE).withOpacity(0.9),
                  Color(0xFF1E1E1E).withOpacity(0.6),
                ],
                    begin: const FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight)),
            child: Column(
              children: [
                Container(
                    padding:
                        const EdgeInsets.only(top: 70, left: 30, right: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => HomeScreen());
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(child: Container()),
                              Icon(
                                Icons.info_outline,
                                size: 25,
                                color: Colors.white,
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Abs Workout",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 50),
                          Row(
                            children: [
                              Container(
                                width: 90,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color(0xFFB3A0FF),
                                    Color(0xFF896CFE),
                                  ]),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "25 mins",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                width: 250,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color(0xFFB3A0FF),
                                    Color(0xFF896CFE),
                                  ]),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "No jumping, No equipments",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ])),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Row(
                        children: [
                          SizedBox(width: 30),
                          Text(
                            "Activity: Abs Workout",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(child: Container()),
                          Row(
                            children: [
                              Icon(
                                Icons.loop,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "2 reps",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 30),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 180),
                        child: Text(
                          "*Click on thumbnail to play videos",
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        color: Color(0xFF1E1E1E),
                        child: ListView.builder(
                          itemCount: videoUrls.length,
                          itemBuilder: (context, index) {
                            final videoID =
                                YoutubePlayer.convertUrlToId(videoUrls[index]);

                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        PLayerScreen(videoId: videoID)));
                              },
                              child: Image.network(YoutubePlayer.getThumbnail(
                                  videoId: videoID!)),
                            );
                          },
                        ),
                      ))
                    ],
                  ),
                )),
              ],
            )));
  }

  Widget thubmNail() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      color: Color(0xFF1E1E1E),
      child: const Center(
        child: Text("THUMBNAIL"),
      ),
    );
  }
}
