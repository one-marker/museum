import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:museum/screens/tab_exhibits_1.dart';
import 'package:museum/widget/orientation/portrait_landscape_player_page.dart';

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
  List popularBooks;
  List books;
  ScrollController _scrollController;
  TabController _tabController;

  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/popularBooks.json")
        .then((s) {
      setState(() {
        popularBooks = json.decode(s);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString("json/books.json")
        .then((s) {
      setState(() {
        books = json.decode(s);
      });
    });
  }

  List _items = [];

  PageController _pageController;

  _Tab1State(PageController pageController) {
    _pageController = pageController;
  }

  // Future<void> readJson() async {
  //   final String response = await rootBundle.loadString('assets/sample.json');
  //   final data = await json.decode(response);
  //   print(data["items"][0]["id"]);
  //   setState(() {
  //     _items = data["items"];
  //     print(_items[0]["id"]);
  //   });
  // }

  TextEditingController titleMovie;
  List data;

  Future<String> loadJsonData() async {
    final String response =
        await rootBundle.loadString('assets/signal/movie.json');
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
            fontWeight: FontWeight.w800));
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height-250;
    final double screenWidth = MediaQuery.of(context).size.width;
    //print(_items[0]["id"]);
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        body: Column(children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  "Музей войск связи",
                  style: new TextStyle(
                      fontSize: 28.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Avenir"),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(right: 20),
              //   child: Expanded(
              //
              //     child: Image.asset('assets/home/mus_icon1.webp',
              //         width: 50,
              //         fit: BoxFit.fitWidth),
              //   ),
              // ),



            ],
          ),
          Container(
            color: Colors.white24,
            padding: const EdgeInsets.only(left: 20),
            // margin: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 0),
                  //margin: EdgeInsets.fromLTRB(75, 100, 75, 0),
                  // height: 100,
                  // width: 300,
                  //color: Colors.green,

                child: Align(alignment:Alignment.centerLeft , child: RichText(
                  text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Avenir"),
                    children: [
                      // TextSpan(text: 'Created with '),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Icon(Icons.movie),
                        ),
                      ),
                      TextSpan(text: 'Рекомендуем к просмотру'),
                    ],
                  ),
                )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: screenHeight,

                    child: Stack(children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: screenHeight,
                            child: PageView.builder(
                                controller:
                                    PageController(viewportFraction: 0.8),
                                itemCount: _items == null ? 0 : _items.length,
                                itemBuilder: (_, i) {
                                  return GestureDetector(
                                    onTap: () async {
                                      if (i != 0) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PortraitLandscapePlayerPage(
                                                      "assets/movies/plane.mp4")),
                                        );
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Tab1Exhibits(null)),
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: screenHeight,
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.only(right: 10),
                                      // margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(changeImg(i)),
                                            fit: BoxFit.fitWidth,
                                          )),
                                    ),
                                  );
                                }),
                          ))
                    ])),
                SizedBox(
                  height: 20,
                ),


              ],
            ),
          ),
          // SizedBox(
          //   height: 00,
          // ),
          //
          // Container(
          //  // color: Colors.white,
          //   padding: EdgeInsets.all(20),
          //   // margin: const EdgeInsets.only(bottom: 20),
          //
          //   child: FlatButton(
          //
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     height: 65,
          //     minWidth: 500,
          //     child: Text(
          //       'Экспонаты',
          //       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          //     ),
          //     color: Colors.black87,
          //     textColor: Colors.white,
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => Tab1Exhibits(null)),
          //       );
          //     },
          //   ),
          // ),
          // Container(
          //   //color: Colors.white30,
          //   // padding: const EdgeInsets.all(20),
          //   padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
          //   child:  Text(
          //       "Обобщающее название рода специальных войск Вооружённых сил Российской Федерации, который раздельно существует во всех трёх видах вооружённых сил.",
          //       style: TextStyle(color: Colors.black38, fontSize: 15),
          //       textAlign: TextAlign.center),
          // ),


        ]));
  }
  String changeImg(int i) {
    if(MediaQuery.of(context).size.width>MediaQuery.of(context).size.height) {
      print("change");
      return "assets/signal/img/"+ "1.jpg";
    } else {
      return "assets/signal/img/" +
          _items[i]["id"];
    }
  }

  @override
  bool get wantKeepAlive => true;
}
