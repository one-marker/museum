import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {

  String img;
  String name;

  String description;
  ItemScreen(String name, String img, String description) {
    this.img = img;
    this.name = name;
    this.description = description;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: AppColors.audioBluishBackground,
      backgroundColor: Colors.blueGrey[100],
      body: Stack(
        children: [
          Positioned(
              top: screenHeight*0.01,
              left: 0,
              right: 0,
              height: screenHeight / 2,
              child: GestureDetector(
                child: Image.asset(
                  img,
                  fit: BoxFit.fitHeight,
                ),
                // onTap: () async {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => SecondRoute()),
                //   );
                // },
              )),
          Positioned(
              top: 15,
              left: 15,
              right: 0,
              child: AppBar(
                leading: Container(

                    decoration: ShapeDecoration(

                      color: Colors.white70,
                      shape: CircleBorder(),
                    ),

                    child:IconButton(

                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        //advancedPlayer.stop();
                      },
                    )),

                backgroundColor: Colors.transparent,
                elevation: 0.0,



              )),
          Positioned(
              left: 0,
              right: 0,
              top: screenHeight * 0.45,
              height: screenHeight * 0.86,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: screenHeight * 0.1,
                      // ),
                      SizedBox(
                        height:40,
                      ),
                      Text(
                        this.name,

                        textAlign: TextAlign.center,
                        style: TextStyle(

                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Avenir"),
                      ),

                      new Expanded(
                          flex: 1,
                          child: new SingleChildScrollView(
                            padding: const EdgeInsets.all(44.0),
                            scrollDirection: Axis.vertical, //.horizontal
                            child: new Text(
                              description,
                              style: new TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                              ),
                            ),
                          ))
                      //AudioFile(advancedPlayer:advancedPlayer, audioPath:this.widget.booksData[this.widget.index]["audio"]),
                    ],
                  ))),

        ],
      ),
    );

  }
}
