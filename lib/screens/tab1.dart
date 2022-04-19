import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:museum/screens/item.dart';

import '../main2.dart';
import '../app_colors.dart' as AppColors;

class Tab1 extends StatefulWidget {
  PageController _pageController;

  Tab1(PageController pageController) {
    _pageController = pageController;
  }
  @override
  _Tab1State createState() => _Tab1State(_pageController);
}

class _Tab1State extends State<Tab1> with AutomaticKeepAliveClientMixin<Tab1> {
  List _items = [];
  PageController _pageController;

  _Tab1State(PageController pageController) {
    _pageController = pageController;
  }


  List data;

  Future<String> loadJsonData() async {
    final String response =
        await rootBundle.loadString('assets/signal/sample.json');
    final data = await json.decode(response);
    print(data["items"][0]["id"]);
    setState(() {
      _items = data["items"];
      print(_items[0]["id"]);
    });
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  // List<Widget> getList() {
  //   List<Widget> list = new List<Widget>();
  //   for (var i = 0; i < _items.length; i++) {
  //     list.add(Card(color: Colors.white70, child: GestureDetector(
  //
  //       // padding: const EdgeInsets.all(2),
  //       onTap: () async {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => SecondRoute(_items[i]["name"], 'assets/signal/img/' + _items[i]["id"], _items[i]["description"])),
  //         );
  //       },
  //       // color: Colors.white,
  //       child :Column(
  //
  //         children: [
  //           Image.asset('assets/signal/img/' + _items[i]["id"], fit: BoxFit.fitHeight,),
  //           Row(mainAxisAlignment: MainAxisAlignment.start,
  //           children: [ Flexible(
  //             child: Container(
  //               padding: const EdgeInsets.all(14),
  //               child: Text(_items[i]["name"],
  //                   softWrap: true,
  //                   overflow: TextOverflow.ellipsis,
  //                   //textAlign: TextAlign.left,
  //                   style: new TextStyle(
  //                       fontSize: 16.0,
  //                       color: Colors.black87,
  //                       fontWeight: FontWeight.w800)
  //              // buildCardTitle(_items[i]["name"].toString(),14)
  //
  //
  //           )))],),
  //
  //         ],
  //       ),
  //
  //       // color: Colors.white,
  //     ),));
  //   }
  //   //}
  //   return list;
  // }


  Widget buildCardTitle(String text, int short) {
    int min = text.length;
    String end = "..";
    if (min <= short) {
      short = min;
      end = "";
    }

    return Text(text.substring(0, short) + end,
        softWrap: true,
        overflow: TextOverflow.fade,
        //textAlign: TextAlign.left,
        style: new TextStyle(
        fontSize: 16.0,
        color: Colors.black87,
        fontWeight: FontWeight.w800)
    );
  }


  List<Widget> getList() {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < _items.length; i++) {
      list.add(
        Container(
            // color: Colors.white,
            child:
          GestureDetector(

              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemScreen(_items[i]["name"], 'assets/signal/img/' + _items[i]["id"], _items[i]["description"])),
                );
              },
            child:
          GridTile(

            key: ValueKey(_items[i]["id"]),
            child:
            Stack(
                children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,

              child:
              Image.asset('assets/signal/img/' + _items[i]["id"],
              fit: BoxFit.fitWidth,

            ))]),
            footer: GridTileBar(

              backgroundColor: Colors.white,
              title: Text(
                _items[i]["name"],
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
               subtitle:
               Text(
                 _items[i]["description"],
                 style: const TextStyle(
                     color: Colors.black,
                     fontSize: 12,
                     fontWeight: FontWeight.normal),
               ),
              // trailing: const Icon(Icons.shopping_cart),
            ),
          )))


  /*        Container(
        padding: const EdgeInsets.all(2),
        child: GestureDetector(
          child: Image.asset('assets/signal/img/' + _items[i]["id"],
              fit: BoxFit.fitHeight),

          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute(_items[i]["name"], 'assets/signal/img/' + _items[i]["id"], _items[i]["description"])),
            );
          },
        ),
        color: Colors.white,
      )
      */
      );
    }
    //}
    return list;
  }

  @override
  Widget build(BuildContext context) {
    // print(_items[0]["id"]);
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        // appBar: AppBar(
        //   title: Text('Музей связи'),
        //     actions: [
        //       PopupMenuButton(
        //           itemBuilder: (context) => [
        //             PopupMenuItem(
        //               child: Text("Фильм 1"),
        //               value: 1,
        //             ),
        //             PopupMenuItem(
        //               child: Text("Фильм 2"),
        //               value: 2,
        //             )
        //           ]
        //       )
        //     ]
        // ),

        body: Column(children: [
          SizedBox(height: 30,),
      Row(
        children: [
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text("Музей войск связи", style: new TextStyle(
                  fontSize: 28.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Avenir"),
              ),)
        ],
      ),
          Expanded(child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              childAspectRatio: 0.89,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: getList(),


            ),
          ),
        ],
      )),
    ]));
  }

  @override
  bool get wantKeepAlive => true;
}

// class ImageDialog extends StatelessWidget {
//   String description;
//
//   ImageDialog(String description) {
//     this.description = description;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         width: 200,
//         height: 200,
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: ExactAssetImage('assets/tamas.jpg'), fit: BoxFit.cover)),
//         child: Text(this.description),
//       ),
//     );
//   }
// }

// class SecondRoute extends StatelessWidget {
//
//   String img;
//   String name;
//
//   String description;
//   SecondRoute(String name, String img, String description) {
//     this.img = img;
//     this.name = name;
//     this.description = description;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//      // backgroundColor: AppColors.audioBluishBackground,
//       backgroundColor: Colors.blueGrey[100],
//       body: Stack(
//         children: [
//           Positioned(
//               top: screenHeight*0.01,
//               left: 0,
//               right: 0,
//               height: screenHeight / 2,
//               child: GestureDetector(
//                 child: Image.asset(
//                   img,
//                   fit: BoxFit.fitHeight,
//                 ),
//                 // onTap: () async {
//                 //   Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(builder: (context) => SecondRoute()),
//                 //   );
//                 // },
//               )),
//           Positioned(
//               top: 15,
//               left: 15,
//               right: 0,
//               child: AppBar(
//                 leading: Container(
//
//                     decoration: ShapeDecoration(
//
//                       color: Colors.white,
//                       shape: CircleBorder(),
//                     ),
//
//                     child:IconButton(
//
//                   icon: Icon(
//                     Icons.arrow_back_ios,
//                     color: Colors.black,
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     //advancedPlayer.stop();
//                   },
//                 )),
//                 actions: [
//                   IconButton(
//
//                     icon: Icon(
//                       Icons.search,
//                     ),
//                     onPressed: () {},
//                   )
//                 ],
//                 backgroundColor: Colors.transparent,
//                 elevation: 0.0,
//
//
//
//               )),
//           Positioned(
//               left: 0,
//               right: 0,
//               top: screenHeight * 0.45,
//               height: screenHeight * 0.86,
//               child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(40),
//                     color: Colors.white,
//                   ),
//                   child: Column(
//                     children: [
//                       // SizedBox(
//                       //   height: screenHeight * 0.1,
//                       // ),
//                     SizedBox(
//                        height:40,
//                      ),
//                       Text(
//                         this.name,
//
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: "Avenir"),
//                       ),
//
//                       new Expanded(
//                           flex: 1,
//                           child: new SingleChildScrollView(
//                             padding: const EdgeInsets.all(44.0),
//                             scrollDirection: Axis.vertical, //.horizontal
//                             child: new Text(
//                               description,
//                               style: new TextStyle(
//                                 fontSize: 16.0,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                           ))
//                       //AudioFile(advancedPlayer:advancedPlayer, audioPath:this.widget.booksData[this.widget.index]["audio"]),
//                     ],
//                   ))),
//           // Positioned(
//           //     top:screenHeight*0.12,
//           //     left: (screenWidth-300)/2,
//           //     right: (screenWidth-300)/2,
//           //     height: screenHeight*0.36,
//           //     child: Container(
//           //
//           //       child: Padding(
//           //         padding: const EdgeInsets.all(20),
//           //         child: Container(
//           //           decoration: BoxDecoration(
//           //             //borderRadius: BorderRadius.circular(20),
//           //
//           //               border: Border.all(color:Colors.white, width: 5),
//           //               image:DecorationImage(
//           //                   image:AssetImage('assets/signal/img/1.jpg'),
//           //                   fit:BoxFit.cover
//           //               )
//           //           ),
//           //         ),
//           //       ),
//           //     )
//           //
//           // )
//         ],
//       ),
//     );
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: const Text('Second Route'),
//     //   ),
//     //   body: Center(
//     //     child: ElevatedButton(
//     //       onPressed: () {
//     //         Navigator.pop(context);
//     //       },
//     //       child: const Text('Go back!'),
//     //     ),
//     //   ),
//     // );
//   }
// }
