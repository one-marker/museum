import 'package:flutter/material.dart';
import 'package:museum/screens/tab1.dart';

import 'screens/tab_exhibits_1.dart';
import 'screens/tab2.dart';
import 'screens/tab3.dart';

class TabContainerDefault extends StatefulWidget {
  TabContainerDefault({Key key}) : super(key: key);

  @override
  _TabContainerDefaultState createState() => _TabContainerDefaultState();
}

class _TabContainerDefaultState extends State<TabContainerDefault> {
  List<Widget> listScreens;
  @override
  void initState() {
    super.initState();
    listScreens = [
      Tab1(null),
      Tab2(null),
      Tab3(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellow,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(), children: listScreens),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                text: 'Музей связи',
                icon: Icon(Icons.radio),
              ),
              Tab(
                text: 'Музей Михайлова',
                icon: Icon(Icons.assignment_ind),
              ),
              Tab(
                text: 'Фильмы',
                icon: Icon(Icons.movie),
              ),
            ],
          ),
          backgroundColor: Colors.black12,//Theme.of(context).primaryColorDark,
          //primaryColor,
        ),
      ),
    );
  }
}
