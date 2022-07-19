

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopping/controllers/newsController.dart';

import '../../dimensions.dart';
import '../bigfont.dart';
import '../navigation/routes.dart';
import '../smalltext.dart';
import '../widget/NewsWidget.dart';
import '../widget/bottombar/buttomnavigationBar.dart';
import '../widget/specialoffer.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<NewsController>().getNewsMainList();
    return Scaffold(body: Container( margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,end: Alignment.bottomCenter,
              colors: [Color(0xff432d91),Color(0xff080846),
             //  colors: [Color(0xff55599f),Color(0xff111350)
              ]
          )),
      padding: EdgeInsets.all(20).copyWith(top: 40),
      child: Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container( padding: EdgeInsets.only(bottom: Dimensions.height10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      "Latest News",color: Colors.grey.shade200,
                    ),
                    SizedBox(height: Dimensions.height10,),
                    SmallTxt("What would you want to do today",
                        color: Colors.grey.shade400),
                  ],
                ),
              ),
              Icon(
                Icons.notifications_none_outlined,
                size: 24,
                color: Colors.grey.shade200,
              )
            ],
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView( scrollDirection: Axis.horizontal,
                    child:
                    SpecialOfferCard(),



                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.height10,),
          SmallTxt("Trending news",
              color: Colors.grey.shade400),
          SizedBox(height: Dimensions.height10,),

         Container(
           child: Expanded(
             child: SingleChildScrollView( 
               child: GetBuilder<NewsController>(builder: (newz){
                 return ListView.builder( itemCount: newz.newsModalList.length,
                     shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
                     itemBuilder: (BuildContext, index){
                       return  GestureDetector(
                         onTap:(){Get.toNamed(Routes.getFullnewspage(index));},
                         child: NewsCard(backgroundcolor: const Color(0xff55599f),
                           child: Row( crossAxisAlignment: CrossAxisAlignment.start,
                               children:[
                                 Container( height: 200,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(20)
                                   ),
                                   child:Container( width: 130,
                                     child: ClipRRect( borderRadius: BorderRadius.circular(5),
                                         child: Image(image: AssetImage('assets/newsphoto/eth.jpg'),fit: BoxFit.cover)),//NetworkImage(newz.newsModalList[index].image_url!)

                                   ) ,),
                                 SizedBox(width: Dimensions.width10,),
                                 Expanded(
                                   child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       SizedBox(height: Dimensions.height10,),
                                       BigText('${newz.newsModalList[index].title}',color: Colors.grey.shade200,size: 18,),
                                       SizedBox(height: Dimensions.height10,),
                                        SmallTxt('${newz.newsModalList[index].description}',color: Colors.grey.shade400,size: 14,),
                                        SmallTxt('${newz.newsModalList[index].pubDate}',color: Colors.green.shade400,size: 14,)
                                     ],),
                                 )
                               ]
                           ),
                         ),
                       );
                     });
               }),
             ),
           ),
         )
        ],
      ),

    ),

    bottomNavigationBar: BottomNavigation(),
    );
  }
}
