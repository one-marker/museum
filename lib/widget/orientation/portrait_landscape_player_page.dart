import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:museum/main.dart';
import 'package:museum/widget/orientation/video_player_both_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class PortraitLandscapePlayerPage extends StatefulWidget {
  @override
  _PortraitLandscapePlayerPageState createState() =>
      _PortraitLandscapePlayerPageState();
}

class _PortraitLandscapePlayerPageState
    extends State<PortraitLandscapePlayerPage> {
  VideoPlayerController controller;

  final asset = 'assets/video.mp4';
  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          //toolbarHeight: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              AutoOrientation.portraitUpMode();
             // controller.
             // if (isPortrait) {
                //Wakelock.disable();
               // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
            //  } else {
                //Wakelock.enable();
              //  SystemChrome.setEnabledSystemUIOverlays([]);
           //   }
              Navigator.of(context).pop();
              //advancedPlayer.stop();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        backgroundColor: Colors.black87,//Colors.blueGrey[100],
        body: Stack(
          children: [

          VideoPlayerBothWidget(controller: controller)
        ],) ,
      );
}
