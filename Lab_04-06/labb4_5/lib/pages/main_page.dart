import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labb4_5/pages/bar_item_page.dart';
import 'package:labb4_5/pages/home_page.dart';
import 'package:labb4_5/pages/my_page.dart';
import 'package:labb4_5/pages/search_page.dart';

class MainPage extends StatefulWidget{
  const MainPage({Key? key}):super(key:key);

  @override
  _MainPageState createState()=> _MainPageState();
}

class _MainPageState extends State<MainPage>{
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  int currentIndex = 0;
  void onTap(int index){
setState((){
  currentIndex = index;
});
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Apps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            label: 'Chart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
),
    );
  }
}