import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:labb4_5/pages/PageView_test.dart';
import 'package:labb4_5/widgets/app_buttons.dart';
import 'package:labb4_5/widgets/app_large_text.dart';
import 'package:labb4_5/widgets/app_text.dart';
import 'package:labb4_5/widgets/responsive_button.dart';
import 'home_page.dart';

class DetailPage extends StatefulWidget{
  const DetailPage({Key? key}):super(key:key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>{

  int gottenStars = 4;
  int selectedIndex = 0;
  final _controller = PageController();


  @override
  Widget build(BuildContext context){
    final MyArguments args = ModalRoute.of(context)!.settings.arguments as MyArguments;
    String image = args.image;
    String moun_text = args.moun_text;
    String location = args.location;
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child:
                    Container(
                      width: double.maxFinite,
                      height: 320,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Positioned(
                    left: 20,
                    top: 40,
                    child:
                    Row(
                      children: [
                        //color: Colors.white,
                        IconButton(onPressed: (){}, icon: Icon(Icons.menu, size: 30), color: Colors.white),
                        SizedBox(width: 260,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, size: 30), color: Colors.white),
                      ],
                    )),
                Positioned(
                    top: 300,
                    child:
                    Container(
                      padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 600,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(text: moun_text),
                              AppLargeText(text: "\$ 250", color: const Color(0xFF5d69b3),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: const Color(0xFF5d69b3),),
                              SizedBox(width: 5,),
                              AppText(text: location, color: const Color(0xFF5d69b3),)
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(Icons.star, color: index < gottenStars? Colors.amber:Colors.grey);
                                }),
                              ),
                              AppText(text: "(4.0)"),
                            ],
                          ),
                          SizedBox(height: 20,),
                          AppLargeText(text: "People", size: 20,),
                          SizedBox(height: 5,),
                          AppText(text: "Number of people in your group"),
                          Wrap(
                            children: List.generate(5, (index){
                              return InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10, top: 10),
                                  child:  AppButtons(
                                    size: 50,
                                    color: selectedIndex == index?Colors.white: Colors.black,
                                    backgroundColor: selectedIndex == index?Colors.black:  Colors.grey.withOpacity(0.4),
                                    borderColor: selectedIndex == index?Colors.black:Colors.grey.withOpacity(0.4),
                                    text: (index+1).toString(),
                                    //icon: Icons.favorite_border,
                                    //isIcon: true

                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: 20,),
                          AppLargeText(text: "Description", size: 20,),
                          SizedBox(height: 5,),
                          AppText(text: "Yosemite National Park is located in central Sierra Nevada in the US state of California. It is located near the wild protected areas."),
                        ],
                      ),
                    )),
                Positioned(
                    bottom: 20,
                    left: 30,
                    right: 30,
                    child: Row(
                      children: [
                        AppButtons(
                            size: 60,
                            color: const Color(0xFF5d69b3),
                            backgroundColor: Colors.white,
                            borderColor: const Color(0xFF5d69b3),
                            isIcon: true,
                            icon: Icons.favorite_border),
                        SizedBox(width: 20,),
                        ResponsiveButton(
                          isResponsive: true,

                        )
                      ],

                    ))

              ],
            ),
          ),
          PVTest(),
        ],
      )

    );
  }
}