import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tab1 extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> with AutomaticKeepAliveClientMixin<Tab1> {
  List _items = [];


  // @override
  // void initState() {
  //   super.initState();
  //   print('initState Tab1');
  // }

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
    final String response = await rootBundle.loadString('assets/sample.json');
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
  List<Widget> getList() {
    List<Widget> list = new List<Widget>();
     for (var i = 0; i < _items.length; i++) {
       list.add(Container(
         padding: const EdgeInsets.all(8),
         child: GestureDetector(child: Image.asset(
             'assets/img/' + _items[i]["name"], fit: BoxFit.fill),
           onTap: () async {
             await showDialog(
                 context: context,
                 builder: (_) => ImageDialog(_items[i]["description"])
             );
           },
         ),
         color: Colors.white,
       ));
     }
    //}
    return list;
  }

  @override
  Widget build(BuildContext context) {
   // print(_items[0]["id"]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Музей связи'),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Фильм 1"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Фильм 2"),
                    value: 2,
                  )
                ]
            )
          ]
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children:   getList(),

                /*
                Container(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(child: Image.asset('assets/img/'+_items[0]["name"], fit: BoxFit.fill),
                    onTap: () async {
                      await showDialog(
                          context: context,
                          builder: (_) => ImageDialog(_items[0]["description"])
                      );
                    },
                  ),
                  color: Colors.white,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Heed not the rabble'),
                  color: Colors.green[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Sound of screams but the'),
                  color: Colors.green[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Who scream'),
                  color: Colors.green[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Revolution is coming...'),
                  color: Colors.green[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Revolution, they...'),
                  color: Colors.green[600],
                ),
              ],*/
            ),
          ),
        ],
      ),
    );
  }



  @override
  bool get wantKeepAlive => true;
}
class ImageDialog extends StatelessWidget {

  String description;
  ImageDialog(String description) {
    this.description = description;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/tamas.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Text(this.description),
      ),
    );
  }
}