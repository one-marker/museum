import 'package:flutter/material.dart';
import 'package:museum/video//video_items.dart';
import 'package:video_player/video_player.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Flutter Video Player Demo'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[

          VideoItems(
            videoPlayerController: VideoPlayerController.network(
                'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'
            ),
            looping: false,
            autoplay: true,
          ),
          // VideoItems(
          //   videoPlayerController: VideoPlayerController.asset(
          //     'assets/video_3.mp4',
          //   ),
          //   looping: false,
          //   autoplay: false,
          // ),
          // VideoItems(
          //   videoPlayerController: VideoPlayerController.asset(
          //     'assets/video_2.mp4',
          //   ),
          //   autoplay: true,
          // ),
          // VideoItems(
          //   videoPlayerController: VideoPlayerController.network(
          //       "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4"
          //   ),
          //   looping: true,
          //   autoplay: false,
          // ),
        ],
      ),
    );
  }
}