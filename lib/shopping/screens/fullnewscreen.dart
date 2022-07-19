import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/coin_controller.dart';
import 'package:shopping/controllers/newsController.dart';
import 'package:shopping/dimensions.dart';
import 'package:shopping/shopping/bigfont.dart';
import 'package:shopping/shopping/smalltext.dart';
import 'package:shopping/shopping/widget/NewsWidget.dart';
import 'package:shopping/candleSticks.dart';
import 'package:shopping/shopping/widget/glassCard.dart';
import 'package:candlesticks/candlesticks.dart';

import '../../utils/appDataBase.dart';
import '../navigation/routes.dart';

class FullNews extends StatelessWidget {
   FullNews( this.index, {Key? key}) : super(key: key);
   final int index;

  @override
  Widget build(BuildContext context) {
    Get.put(()=>NewsController(newsRepo: Get.find()));
    Get.put(()=>CoinController(coinRepo:Get.find()));
    Get.find<NewsController>().getNewsMainList();
    Get.find<CoinController>().getCoinList();
    return Scaffold( backgroundColor: Color(0xff111350),
      body: Container( margin: EdgeInsets.symmetric(horizontal: 10).copyWith(top: 40),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,end: Alignment.bottomCenter,
                colors: [Color(0xff55599f),Color(0xff111350)]
            )),
        child: CustomScrollView(
          slivers: [
          SliverAppBar( automaticallyImplyLeading: false,
          pinned: true,
          expandedHeight: 250,
          flexibleSpace: Hero(tag: 'manCard',
              child: GetBuilder<NewsController>(
                builder: (newz) {
                  return Container(
                    child: Stack(
                      children: [
                        Positioned( top:0,left: 0,right: 0,
                          child: Image(image: AssetImage('assets/newsphoto/eth.jpg'),
                            fit: BoxFit.cover,),
                        ),
                        Positioned( top: 30, left: 20,right: 20,
                            child: IconButton(onPressed:
                                ()async{
                              await Get.find<NewsController>().addToBase(index);
                              await Get.find<NewsController>().savedNews();
                              Get.toNamed(Routes.savedNews);


                              final ink =AppDataBase.instance;
                              //ink.create(index);
                              print("in fullnewssreennnnnnnnnnnnnnn added to crud");
                            },
                                icon: Icon(Icons.favorite,color: Colors.white,)
                            ))
                      ],
                    ),
                  );
                },
              )),

          bottom:PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Container( decoration: BoxDecoration(color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))),
              width: double.maxFinite,padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child:BigText(Get.find<NewsController>().newsModalList[index].title!.toUpperCase(),size: 18,color: Colors.grey.shade100,),),
          ) ,
        ),
            SliverToBoxAdapter(
              child: GetBuilder<NewsController>(builder: (NewsController news){
            return Container( padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SmallTxt("${news.newsModalList[index].source_id}"=='null'?'Author:'+' Google':'${news.newsModalList[index].source_id}',color: Colors.grey.shade300,),
                    SizedBox(height: Dimensions.height15,),
                    SmallTxt('${news.newsModalList[index].content}'=='null'?'Content:'+' I am sorry there are no content at the moment >>>'+' ${news.newsModalList[index].description}':'${news.newsModalList[index].content}',color: Colors.grey.shade300,h: 1.8,)
                  ],
                ),
              ),
            );
          }),)

          ],

        )
        // Column( //crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: [
        //     // Expanded(child: GetBuilder<CoinController>(builder: (control){
        //     //   return Container( color: Colors.grey.shade800,
        //     //     child:Expanded(
        //     //       child: OHLCVGraph(data: control.listtobemap,
        //     //           enableGridLines: true,
        //     //           volumeProp: 0.2, key: null,
        //     //           gridLineColor: Colors.grey,
        //     //         gridLineLabelColor: Colors.blue,
        //     //         gridLineAmount: 8,
        //     //         gridLineWidth: 0.5,
        //     //         enableVolume: false,
        //     //         fallbackWidth: 40,
        //     //         labelPrefix: "price",
        //     //
        //     //       ),
        //     //     )
        //     //
        //     //   );
        //     // })),

        //
        //   ],
        // ),
      ),
    );
  }
}
