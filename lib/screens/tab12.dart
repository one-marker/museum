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
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> with SingleTickerProviderStateMixin<Tab1> {
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

  Future<String> loadJsonData() async {
    final String response =
    await rootBundle.loadString('assets/signal/movie.json');
    final data = await json.decode(response);
    print(data["items"][0]["id"]);
    print(_items.length);
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

  void openBottomModal(int i) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.qr_code_scanner),
                title: Text('Поделиться'),

              ),
              // ListTile(
              //   leading: Icon(Icons.copy),
              //   title: Text('Open'),
              // ),

            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height-250;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      //color: Colors.black54,
      child: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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



              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.white24,
              margin: const EdgeInsets.only(left: 20),
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
            Container(
                height: screenHeight,
                child: Stack(children: [
                  Positioned(
                      top: 0,
                      left: -0,
                      right: 0,
                      child: Container(
                        height: screenHeight,
                        child: PageView.builder(
                            controller: PageController(viewportFraction: 0.8),
                            itemCount:
                            _items == null ? 0 : _items.length,
                            itemBuilder: (_, i) {
                              return GestureDetector(
                                onLongPress:() async {
                                  if (i!=0) {
                                    openBottomModal(i);
                                  }

                                },


                                child: Container(
                                  height: 500,
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image:
                                        AssetImage("assets/signal/img/"+_items[i]["id"]),
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
    );
  }


}
