import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:museum/screens/item.dart';

import '../main2.dart';
import '../app_colors.dart' as AppColors;

class Tab1Exhibits extends StatefulWidget {
  PageController _pageController;

  Tab1Exhibits(PageController pageController) {
    _pageController = pageController;
  }

  @override
  _Tab1ExhibitsState createState() => _Tab1ExhibitsState(_pageController);
}

/**
 * Экспонаты из музея связи
 */
class _Tab1ExhibitsState extends State<Tab1Exhibits>
    with AutomaticKeepAliveClientMixin<Tab1Exhibits> {
  List _items = [];
  PageController _pageController;

  _Tab1ExhibitsState(PageController pageController) {
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
    for (var i = 0; i < _items.length; i++) {
      list.add(Container(
          color: Colors.white,
          child: GestureDetector(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemScreen(
                          _items[i]["name"],
                          'assets/signal/img/' + _items[i]["id"],
                          _items[i]["description"])),
                );
              },
              child: GridTile(
                key: ValueKey(_items[i]["id"]),
                child: Stack(children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/signal/img/' + _items[i]["id"],
                        fit: BoxFit.fitWidth,
                      ))
                ]),
                footer: GridTileBar(
                  backgroundColor: Colors.white,
                  title: Text(
                    _items[i]["name"],
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    _items[i]["description"],
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                  // trailing: const Icon(Icons.shopping_cart),
                ),
              ))));
    }
    //}
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        body: Column(children: [
          SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(250, 0, 0, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48.0),
                    ),
                  ),
                  onPressed: () => {Navigator.of(context).pop()},
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  label: Text(
                    'вернуться',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  "Музей войск связи",
                  style: new TextStyle(
                      fontSize: 25.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w900,
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
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid.count(
                  childAspectRatio: 0.89,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
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
