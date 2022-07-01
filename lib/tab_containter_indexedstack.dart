import 'package:flutter/material.dart';
import 'package:museum/screens/tab1.dart';

import 'screens/tab_exhibits_1.dart';
import 'screens/tab2.dart';
import 'screens/tab3.dart';

class TabContainerIndexedStack extends StatefulWidget {
  TabContainerIndexedStack({Key key}) : super(key: key);

  @override
  _TabContainerIndexedStackState createState() =>
      _TabContainerIndexedStackState();
}

class _TabContainerIndexedStackState extends State<TabContainerIndexedStack> {
  int tabIndex = 0;
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

//  @override
//  bool get wantKeepAlive =>
//      true; //by default it will be null, change it to true.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellow,
      home: Scaffold(
        body: IndexedStack(index: tabIndex, children: listScreens),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabIndex,
            onTap: (int index) {
              setState(() {
                tabIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Tab1',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.report_problem),
                label: 'Tab2',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Tab3',
              ),
            ]),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
