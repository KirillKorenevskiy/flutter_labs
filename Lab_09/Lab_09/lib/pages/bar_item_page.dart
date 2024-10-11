import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarItemPage extends StatelessWidget{
  BarItemPage({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Center(
        child: Text(
            "Bar Item Page"
        ),
      ),
    );
  }
}