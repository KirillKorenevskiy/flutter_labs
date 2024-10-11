import 'package:flutter/material.dart';
import 'package:labb4_5/pages/datail_page.dart';
import 'package:labb4_5/pages/main_page.dart';

void main() {
  runApp(const MyApp());
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