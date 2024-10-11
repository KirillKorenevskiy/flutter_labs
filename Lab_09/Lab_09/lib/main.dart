import 'package:flutter/material.dart';
import 'package:labb4_5/pages/datail_page.dart';
import 'package:labb4_5/pages/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'NavigationBloc/navigation_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => NavigationBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MainPage(),
      //DetailPage() ,
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(), // Начальный экран (Screen1)
        '/DetailPage': (context) => DetailPage(), // Второй экран (Screen2)
      },
    );
  }
}