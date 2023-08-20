// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_sup_app/widget/my_appBar.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String videoUrl;
  final String title;
  const VideoPlayerScreen(
    this.videoUrl,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    String videoUrlId = YoutubePlayer.convertUrlToId(videoUrl).toString();
    print(videoUrlId);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(backArrow: true, title: title, name: ""),
            Expanded(
              child: Center(
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: videoUrlId,
                    flags: YoutubePlayerFlags(
                      autoPlay: true,
                      mute: false,
                    ),
                  ),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
