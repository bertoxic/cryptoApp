
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/shopping/widget/glassCard.dart';

import '../../dimensions.dart';
import '../bigfont.dart';
import '../smalltext.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}
late AnimationController _controller;

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin{
  @override
  void initState() {
    _controller=AnimationController( duration: Duration(seconds: 2), vsync: this);
    _controller.forward();
    _controller.addListener(() {
      setState(() {
      });
     print(_controller.value.toString());
    });
    print("ok this ${_controller.status}");
    super.initState();
  }
  @override
  void dispose() {
createTicker((elapsed) { }).dispose();
super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double moveheight =_controller.value*210+80;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,end: Alignment.bottomCenter,
                  colors: [Color(0xff240865),Color(0xff050505)]
                 // colors: [Color(0xff55599f),Color(0xff111350)]
              )),
          padding: EdgeInsets.all(0).copyWith(top: Dimensions.height30),
          child: Stack( clipBehavior: Clip.none,
            children: [
            Positioned( top: 0,left: 0,right: 0,
                child: Container( height: Dimensions.height100*3, width: double.maxFinite,
                 // color: Colors.blue,
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),),
                    image: DecorationImage(image: AssetImage('assets/newsphoto/modelgal.jpg'),fit:BoxFit.cover,)),
                )),
              Positioned( top: 0,left: 0,right: 0,
                  child: Container( height: Dimensions.height100*3, width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),),
                        gradient: LinearGradient(begin:Alignment.bottomRight,end: Alignment.topLeft,
                        colors: [Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.9)]
                        )

                    ),
                  )),
            Positioned( top:_controller.value*210+40,left: _controller.value*20,right: _controller.value*20,
              child: GestureDetector( onTap: (){
                if(_controller.status==AnimationStatus.completed){
                  print(_controller.status);
                  setState(() {
                    _controller.reverse(from: 5);
                    _controller.value;
                    moveheight =moveheight-100;
                  });
                }else if(_controller.status==AnimationStatus.dismissed){
                  print(_controller.status);
                  setState(() {
                    _controller.forward();
                    _controller.value;
                    moveheight =moveheight-100;
                  });
                }


                },
                child: Container(margin:EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(backgroundImage: AssetImage('assets/newsphoto/modelgal.jpg'),radius: 48,),
                      Container( padding: EdgeInsets.only(bottom: Dimensions.width5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container( margin: EdgeInsets.only(bottom: 10),
                              height: _controller.value*2,),
                            BigText(
                              "Gold Alsez",color: Colors.grey.shade300,
                            ),
                            Container( margin: EdgeInsets.only(bottom: 10),
                              height: _controller.value*2,),
                            SmallTxt("GoldenAlsez@google.com",size: 14,h: 1.8,
                                color: Colors.grey.shade400.withOpacity(_controller.value)),
                            SmallTxt("ID: 157009373",size: 14,h: 1.8,
                                color: Colors.grey.shade400.withOpacity(_controller.value)),
                          ],
                        ),
                      ),
                      SizedBox(width: Dimensions.height45,),
                      Icon(
                        Icons.person,
                        size: 24, color: Colors.grey.shade200,
                      )
                    ],
                  ),
                ),
              ),
            ),
        Positioned( top:400 ,left: 8,right: 8,
            child: Container(child: Column(
              children: [ GlassCard(
                child:Row(children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.assistant_photo_rounded,color: Colors.amber,),),
                  BigText('Nationality: Nigerian',color: Colors.grey.shade200,size: 16,)
                ],)
              ),
                GlassCard(
                    child:Row(children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.color_lens,color: Colors.white,),),
                      BigText('Theme: System-Dark',color: Colors.grey.shade200,size: 16,)
                    ],)
                ),
                GlassCard(
                    child:Row(children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.people_alt_sharp,color: Colors.blue,),),
                      BigText('Connections: +1,243',color: Colors.grey.shade200,size: 16,)
                    ],)
                ),
                GlassCard(
                    child:Row(children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_rounded,color: Colors.purpleAccent,),),
                      BigText('Favourites: 24',color: Colors.grey.shade200,size: 16,)
                    ],)
                )

              ],
            )))

        // Positioned( top: Dimensions.height100*4,left: 8,right: 8,
        //   child: Card( color:Color(0xff55599f).withOpacity(0) ,elevation: 0,
        //     child: Container( margin: EdgeInsets.all(10),
        //       child: Column(children: [
        //         Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //           IconButton(onPressed: (){}, icon: Icon(Icons.assistant_photo_rounded,color: Colors.amber,)),
        //           IconButton(onPressed: (){}, icon: Icon(Icons.description,color: Colors.green,)),
        //           IconButton(onPressed: (){}, icon: Icon(Icons.palette_rounded,color: Colors.lightBlue,)),
        //           IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.lightGreen,))
        //         ],),
        //         SizedBox(height: Dimensions.height15,),
        //         Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             IconButton(onPressed: (){}, icon: Icon(Icons.hail,color: Colors.orangeAccent,),tooltip: 'flag',),
        //             IconButton(onPressed: (){}, icon: Icon(Icons.local_bar_rounded,color: Colors.pink,)),
        //             IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,)),
        //             IconButton(onPressed: (){}, icon: Icon(Icons.bar_chart,color: Colors.white,))
        //           ],),
        //         SizedBox(height: Dimensions.height15,),
        //         Row(children: [
        //           SizedBox(width: Dimensions.height45*0.8,),
        //           IconButton(onPressed: (){}, icon: Icon(Icons.home,color: Colors.lightBlue,))
        //         ],)
        //       ],),
        //     ),
        //
        //     //child: GridView(),
        //   ),
        // ),
        ],)
      ),
    );
  }
}
