import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labb4_5/pages/bar_item_page.dart';
import 'package:labb4_5/pages/home_page.dart';
import 'package:labb4_5/pages/my_page.dart';
import 'package:labb4_5/pages/search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../NavigationBloc/navigation_bloc.dart';
import '../NavigationBloc/navigation_event.dart';
import '../NavigationBloc/navigation_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is NavigationPageChanged) {
            return pages[state.index];
          }
          return pages[0];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          BlocProvider.of<NavigationBloc>(context).add(NavigationTapped(index));
        },
        currentIndex: BlocProvider.of<NavigationBloc>(context).state
                is NavigationPageChanged
            ? (BlocProvider.of<NavigationBloc>(context).state
                    as NavigationPageChanged)
                .index
            : 0,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
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
