import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum/my_tabs.dart';

//import 'package:museum/video_items.dart';
import 'package:museum/widget/orientation/portrait_landscape_player_page.dart';
import 'package:video_player/video_player.dart';

import 'package:museum/app_colors.dart' as AppColors;

class Tab3 extends StatefulWidget {
  @override
  _Tab3State createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> with AutomaticKeepAliveClientMixin<Tab3> {
  @override
  void initState() {
    super.initState();
    print('initState Tab3');
  }

  @override
  Widget build(BuildContext context) {
    print('build Tab3');
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text('Flutter Video Player Demo'),
      //   centerTitle: true,
      // ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  "",
                  style: new TextStyle(
                      fontSize: 28.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w800),
                ),
              )
            ],
          ),
          GestureDetector(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PortraitLandscapePlayerPage("assets/movies/mihamovie.mp4")),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(48),

                child: Text(
                  "Музей Михайлова",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir"),
                ),

                //Image.asset('assets/signal/img/1.jpg', fit: BoxFit.fitHeight),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(48),
            child: GestureDetector(
              child: Text(
                "Средства связи",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Avenir"),
              ),

              //Image.asset('assets/signal/img/1.jpg', fit: BoxFit.fitHeight),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PortraitLandscapePlayerPage("assets/movies/signal.mp4")),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(48),
            child: GestureDetector(
              child: Text(
                "Самолеты Михайлова",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Avenir"),
              ),

              //Image.asset('assets/signal/img/1.jpg', fit: BoxFit.fitHeight),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PortraitLandscapePlayerPage("assets/movies/plane.mp4")),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
