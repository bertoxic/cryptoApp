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

class FavFullPage extends StatelessWidget {
  FavFullPage(this.index, {Key? key}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    Get.put(() => NewsController(newsRepo: Get.find()));
    Get.put(() => CoinController(coinRepo: Get.find()));
    Get.find<NewsController>().getNewsMainList();
    Get.find<CoinController>().getCoinList();
    return Scaffold(
      backgroundColor: Color(0xff252424),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10).copyWith(top: 40),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff343333), Color(0xff2e2e2f)])),
          child: CustomScrollView(
            slivers: [
              GetBuilder<NewsController>(builder: (newz) {
                return SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  expandedHeight: 250,
                  flexibleSpace: Hero(
                      tag: 'manCard',
                      child: Container(
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Image(
                                image: AssetImage('assets/newsphoto/eth.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                top: 30,
                                left: Dimensions.width10*35,
                                right: 20,
                                child: IconButton(
                                    onPressed: () {
                                      //Get.toNamed(Routes.savedNews);
                                      // Get.find<NewsController>()
                                      //     .addToBase(index);
                                      // Get.find<NewsController>().savedNews();
                                      final ink = AppDataBase.instance;
                                      ink.create(index);
                                      print(
                                          "in fullnewssreen ");
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    )))
                          ],
                        ),
                      )),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(40),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      width: double.maxFinite,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: BigText(
                        newz.savednews[index].title!.toUpperCase(),
                        size: 18,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                );
              }),
              SliverToBoxAdapter(
                child:
                    GetBuilder<NewsController>(builder: (NewsController news) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SmallTxt(
                            "${news.savednews[1].source_id}" == 'null'
                                ? 'Author:' + ' Google'
                                : '${news.savednews[1].source_id}',
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(
                            height: Dimensions.height15,
                          ),
                          SmallTxt(
                            '${news.savednews[1].content}' == 'null'
                                ? 'Content:' +
                                    ' I am sorry there are no content at the moment >>>' +
                                    ' ${news.savednews[1].description}'
                                : '${news.savednews[1].content}',
                            color: Colors.grey.shade300,
                            h: 1.8,
                          )
                        ],
                      ),
                    ),
                  );
                }),
              )
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
