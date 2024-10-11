import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labb4_5/widgets/app_large_text.dart';
import 'package:labb4_5/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget{

  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width, this.isResponsive = false}):super(key:key);
  @override
  Widget build(BuildContext context){
    return Flexible(
        child: Container(
          width: double.maxFinite,
          height: 60,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF5d69b3),
      ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: AppLargeText(
              text: "Book trip now",
              color: Colors.white,
              size: 15,),),
          Container(
            margin: const EdgeInsets.only(right: 30),
            child:  Image.asset("lib/images/Arrow.png",
              height: 18),),

        ],
      ),
    ));
  }
}