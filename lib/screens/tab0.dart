import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main2.dart';
import '../app_colors.dart' as AppColors;

class Tab0 extends StatefulWidget {
  PageController _pageController;

  Tab0(PageController pageController) {
    _pageController = pageController;
  }

  @override
  _Tab0State createState() => _Tab0State(_pageController);
}

class _Tab0State extends State<Tab0> with AutomaticKeepAliveClientMixin<Tab0> {
  List _items = [];

  // @override
  // void initState() {
  //   super.initState();
  //   print('initState Tab1');
  // }
  PageController _pageController;

  _Tab0State(PageController pageController) {
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
            fontWeight: FontWeight.w800));
  }

  List<Widget> getList() {
    List<Widget> list = new List<Widget>();

    return [
      // Container(
      //     color: Colors.white24,
      //   padding: const EdgeInsets.all(20),
      //   child:
      //   Row(
      //
      //     children: <Widget>[
      //       Expanded(
      //         flex: 4,
      //
      //         child: Column(
      //
      //           mainAxisSize: MainAxisSize.min,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             Text(
      //               "?????????? ????????????????????!",
      //               style: new TextStyle(
      //                   fontSize: 20.0,
      //                   color: Colors.black87,
      //                   fontWeight: FontWeight.bold,
      //                   fontFamily: "Avenir"),
      //               textAlign: TextAlign.left,
      //             ),
      //             SizedBox(
      //               height: 10,
      //             ),
      //             Text(
      //                 "???? ???????? ???????????????????????????? ?????? ???? ???????????????? ???????????? ???????????????????? ?????????? ?????? ?????? ?????? ??????????. \n?????????? ???? ???????????? ???????????????? ?????? ?????????? ????????????, ?????????????????? ???????????? ?????? ?????? ??????????????????, ?? ?????? ???? ???????????? ???????????? ?? ?????????????? ????????????????????????!",
      //                 style: TextStyle(color: Colors.black, fontSize: 12),
      //                 textAlign: TextAlign.left),
      //           ],
      //         ),
      //       ),
      //     ],
      //   )),
      Container(

          padding: const EdgeInsets.only(top: 10),
          // onTap: () async {
          //   _pageController.animateToPage(1,
          //       duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
          // },

          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                  onTap: () async {
                    _pageController.animateToPage(1,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.bounceOut);
                  },
                  child: Container(
                    child: Image.asset('assets/home/logo-museum.png',
                        fit: BoxFit.fitWidth),
                  )),
            ],
          )),
      Container(
        color: Color.fromRGBO(95, 101, 54, 50),
          //height: MediaQuery.of(context).size.height - 250,
         // margin: const EdgeInsets.only(top: 0, left: 90, right: 90),
          padding: const EdgeInsets.only(top: 0, left: 90, right: 90),
          // onTap: () async {
          //   _pageController.animateToPage(1,
          //       duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
          // },

          child: Row(

            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(50),
                    margin: const EdgeInsets.all(50),
                    // color: Colors.white70,
                    child: GestureDetector(
                        onTap: () async {
                          _pageController.animateToPage(1,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.bounceOut);
                        },
                        child: Image.asset('assets/home/home-signal.png',
                            fit: BoxFit.scaleDown)),
                  )),
              Expanded(

                flex: 4,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(50),
                  margin: const EdgeInsets.all(50),
                  // color: Colors.white70,
                  child: GestureDetector(

                    onTap: () async {
                      _pageController.animateToPage(2,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.bounceOut);
                    },
                    child: Image.asset('assets/home/home-plane.png',
                        width: 100,
                        fit: BoxFit.scaleDown)),
              )),
            ],
          )),
      GestureDetector(
          onTap: () async {
            _pageController.animateToPage(1,
                duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
          },
          child: Row(

            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "?????????? ?????????? ??????????",
                          style: new TextStyle(
                              fontSize: 30.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.w900,
                              fontFamily: "Avenir"),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "???????????????????? ???????????????? ???????? ?????????????????????? ?????????? ?????????????????????? ?????? ???????????????????? ??????????????????, ?????????????? ?????????????????? ???????????????????? ???? ???????? ???????? ?????????? ?????????????????????? ??????.",
                            style: TextStyle(color: Colors.black, fontSize: 11),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            onTap: () async {
                              _pageController.animateToPage(1,
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.bounceOut);
                            },
                            child: Text("???????????????? ",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                                textAlign: TextAlign.left)),
                      ],
                    ),
                  )),
              Expanded(
                flex: 4,
                child: Image.asset('assets/home/home-signal-icon.png',
                    fit: BoxFit.fitWidth),
              ),
            ],
          )),
      GestureDetector(
          onTap: () async {
            _pageController.animateToPage(2,
                duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
          },
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Image.asset('assets/home/home-plane-icon.png',
                    fit: BoxFit.scaleDown),
              ),
              Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(left: 0, right: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "?????????? ?????????????????? ??.??.",
                          style: new TextStyle(
                              fontSize: 30.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.w900,
                              fontFamily: "Avenir"),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "?????????????????? ?? ???????????????????? ????????????????????????. ?????????????????????????????????? ????????????-???????????????????? ???????????? ???????????????????? ??????????????????. ?????????? ???????????????????? ??????????????????, ?????????????? ??????????, ?????????????????????? ?????????????? ???????????? ????????.",
                            style: TextStyle(color: Colors.black, fontSize: 11),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            onTap: () async {
                              _pageController.animateToPage(2,
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.bounceOut);
                            },
                            child: Text("????????????????",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                                textAlign: TextAlign.left)),
                      ],
                    ),
                  )),
            ],
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // print(_items[0]["id"]);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: getList())));
  }

  @override
  bool get wantKeepAlive => true;
}
