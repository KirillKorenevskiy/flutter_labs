import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labb4_5/pages/bar_item_page.dart';
import 'package:labb4_5/pages/my_page.dart';
import 'package:labb4_5/pages/search_page.dart';
import 'package:labb4_5/widgets/app_large_text.dart';
import 'package:labb4_5/widgets/app_text.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}):super(key:key);

  @override
  _HomePageState createState()=> _HomePageState();
}
class MyArguments {
  final String image;
  final String moun_text;
  final String location;

  MyArguments(this.image, this.moun_text, this.location);
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  var images = {
    "i.jpg":"Kayaking",
    "s.jpg":"Snorkeling",
    "b.jpg":"Ballooning",
    "h.jpg":"Hiking"
  };

  List<String> mountains = ["lib/images/mountain.png", "lib/images/mountain2.png", "lib/images/mountain3.png"];
  List<String> mountains_text = ["Cascade", "Yosemite", "Everest"];
  List<String> mountains_text2 = ["Canada, Banff", "USA, California", "Himalayas"];


  @override
  Widget build(BuildContext context){

    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 55, left: 30),
            child: Row(
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black54),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 40,
                  height: 40,

                  decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ), //Menu
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: AppLargeText(text: "Discover"),
          ) ,//Discover
          SizedBox(height: 20),
          //tabbar
          Container(
            child: Align(
             alignment: Alignment.centerLeft,
              child: TabBar(
              //labelPadding: const EdgeInsets.only(right: 10),
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              //isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,

              indicator: CircleTabIndicator(color: const Color(0xFF5d69b3), radius: 4),
              tabs: [
                Tab(text: "Places"),
                Tab(text: "Inspiration"),
                Tab(text: "Emotions"),
              ],
            ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30),
            height: 300,
              width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      InkWell(
                        onTap: () {
                          MyArguments myArguments = MyArguments(mountains[index], mountains_text[index], mountains_text2[index]);
                          Navigator.pushNamed(context, '/DetailPage', arguments: myArguments);
                    },
                          child: Container(
                        margin: const EdgeInsets.only(top: 10, right: 15),
                      width: 200,
                      height: 300,
                            child: Stack(
                            fit: StackFit.expand,
                            children: [
                        // Картинка
                            DecoratedBox(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(mountains[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                              Positioned(
                                bottom: 10,
                                left: 15,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mountains_text[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          mountains_text2[index],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                        ),

                    )
                      );
                  },

                ),
                Text("Inspiration"),
                Text("Emotions"),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(left: 30 , right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore more", size: 22,),
                AppText(text: "See all", color: const Color(0xFF989acd),)
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 30),
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_ , index){
              return Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: Column(
                    children: [
                      Container(
                        //margin: const EdgeInsets.only(right: 50),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius:  BorderRadius.circular(20),
                            color:  Colors.white,
                            image: DecorationImage(
                                image: AssetImage(
                                    "lib/images/" + images.keys.elementAt(index)
                                ),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        child: AppText(text: images.values.elementAt(index), color: const Color(0xFF878593),

                        ),
                      )
                    ],
                  )
              );
            }),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
@override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration){
  Paint _paint= Paint();
  _paint.color = color;
  _paint.isAntiAlias = true;
  final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height - radius);
canvas.drawCircle(offset+circleOffset, radius, _paint);
}
}