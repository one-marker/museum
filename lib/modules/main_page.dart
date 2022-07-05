import 'package:museum/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum/screens/tab0.dart';
import 'package:museum/screens/tab1.dart';
import 'package:museum/screens/tab_exhibits_1.dart';
import 'package:museum/screens/tab2.dart';
import 'package:museum/screens/tab3.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

enum BottomIcons { Home, Favorite, Search, Account }

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inactiveColor = Colors.grey;
    final activeColor = Colors.red;
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Tab0(_pageController),
            Tab1(_pageController),
            Tab2(_pageController),
            Tab3(),
            Container(
              color: Colors.indigo,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.transparent,
        itemCornerRadius: 12,
        containerHeight: 60,
        showElevation: false,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
          //_pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Главная'),
              icon: Icon(Icons.museum),
              textAlign: TextAlign.center,
              inactiveColor: inactiveColor,
              activeColor: activeColor),
          BottomNavyBarItem(
              title: Text('Музей войск связи '),
              icon: Icon(Icons.radio),
              textAlign: TextAlign.center,
              inactiveColor: inactiveColor,
              activeColor: activeColor),
          BottomNavyBarItem(
              title: Text('Музей Михайлова В.С.'),
              icon: Icon(Icons.airplanemode_active),
              textAlign: TextAlign.center,
              inactiveColor: inactiveColor,
              activeColor: activeColor),
          // BottomNavyBarItem(
          //     title: Text('Фильмы'),
          //     icon: Icon(Icons.movie),
          //     textAlign: TextAlign.center,
          //     inactiveColor: inactiveColor,
          //     activeColor: activeColor),
          // BottomNavyBarItem(
          //     title: Text('Настройки'),
          //     icon: Icon(Icons.settings)
          // ),
        ],
      ),
    );
  }
// BottomIcons bottomIcons = BottomIcons.Home;
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Stack(
//       children: <Widget>[
//         bottomIcons == BottomIcons.Home
//             ? Center(
//                 child: Text(
//                   "Hi, this is home page",
//                   style: TextStyle(fontSize: 18),
//                 ),
//               )
//             : Container(),
//         bottomIcons == BottomIcons.Favorite
//             ? Center(
//                 child: Text(
//                   "Hi, this is favorite page",
//                   style: TextStyle(fontSize: 18),
//                 ),
//               )
//             : Container(),
//         bottomIcons == BottomIcons.Search
//             ? Center(
//                 child: Text(
//                   "Hi, this is search page",
//                   style: TextStyle(fontSize: 18),
//                 ),
//               )
//             : Container(),
//         bottomIcons == BottomIcons.Account
//             ? Center(
//                 child: Text(
//                   "Hi, this is account page",
//                   style: TextStyle(fontSize: 18),
//                 ),
//               )
//             : Container(),
//         Align(
//           alignment: Alignment.bottomLeft,
//           child: Container(
//             padding: EdgeInsets.only(left: 24, right: 24, bottom: 30),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 BottomBar(
//                     onPressed: () {
//                       setState(() {
//                         bottomIcons = BottomIcons.Home;
//                       });
//                     },
//                     bottomIcons:
//                         bottomIcons == BottomIcons.Home ? true : false,
//                     icons: EvaIcons.home,
//                     text: "Главная"),
//                 BottomBar(
//                     onPressed: () {
//                       setState(() {
//                         bottomIcons = BottomIcons.Favorite;
//                       });
//                     },
//                     bottomIcons:
//                         bottomIcons == BottomIcons.Favorite ? true : false,
//                     icons: EvaIcons.heartOutline,
//                     text: "Музей войск связи"),
//                 BottomBar(
//                     onPressed: () {
//                       setState(() {
//                         bottomIcons = BottomIcons.Search;
//                       });
//                     },
//                     bottomIcons:
//                         bottomIcons == BottomIcons.Search ? true : false,
//                     icons: EvaIcons.search,
//                     text: "Музей Михайлова"),
//                 BottomBar(
//                     onPressed: () {
//                       setState(() {
//                         bottomIcons = BottomIcons.Account;
//                       });
//                     },
//                     bottomIcons:
//                         bottomIcons == BottomIcons.Account ? true : false,
//                     icons: EvaIcons.personOutline,
//                     text: "Account"),
//               ],
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }
}
