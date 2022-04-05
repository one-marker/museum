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
      Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Добро пожаловать!",
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir"),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Мы рады приветствовать вас на странице нашего приложения Музея ВУЦ при РТУ МИРЭА. \nЗдесь вы можете посетить наш музей онлайн, подробнее узнать про все экспонаты, а так же больше узнать о военной радиотехнике!",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    textAlign: TextAlign.left),
              ],
            ),
          ),
        ],
      ),
      GestureDetector(
          onTap: () async {
            _pageController.animateToPage(1,
                duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
          },
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Музей войск связи",
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Avenir"),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Обобщающее название рода специальных войск Вооружённых сил Российской Федерации, который раздельно существует во всех трёх видах вооружённых сил.",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        textAlign: TextAlign.left),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Image.asset('assets/home/popov_img.webp',
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

                  child: Image.asset('assets/home/airplane.png',
                      fit: BoxFit.scaleDown),


              ),   Expanded(
                flex: 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Музей Михайлова В.С.",
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Avenir"),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Советский и российский военачальник. Главнокомандующий Военно-воздушными силами Российской Федерации. Герой Российской Федерации, генерал армии, Заслуженный военный лётчик СССР.",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        textAlign: TextAlign.left),
                  ],
                ),
              ),
            ],
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // print(_items[0]["id"]);
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        body: Column(children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  "Главная",
                  style: new TextStyle(
                      fontSize: 28.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir"),
                ),
              )
            ],
          ),
          Expanded(
              child: CustomScrollView(
            primary: false,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(22),
                sliver: SliverGrid.count(
                  childAspectRatio: 2.1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 1,
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
