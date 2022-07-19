import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/newsController.dart';
import 'package:shopping/shopping/widget/glassCard.dart';
import '../../dimensions.dart';
import '../CardWidget.dart';
import '../bigfont.dart';
import '../smalltext.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<NewsController>();
    final List<String> myOffer=[
      "The weather migh affect stocks",
      "weldone on these offers you are selected",
      "How can yo get 50% OFF",
      "weldone on these offers",
    ];
    final myProducts = List<String>.generate(10, (i) => 'product $i');

    return GetBuilder<NewsController>(builder: (newz){
      return Container( height: 120,
        child: ListView.builder( itemCount: myOffer.length,shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return
              Row(
                children: [
                  ColorCard(height:Dimensions.height100*2,width: 300,
                    padding: 10,
                    backgroundcolor: Color(0xffe8e8f1),
                    child: Container(
                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(child:newz.newsModalList==null? BigText('nothing') :BigText('${newz.newsModalList[index].title??'null'}',size: 16,color:Color(0xff111350) ,)),
                          Flexible(
                            child: SmallTxt("hui",
                              //"${newz.newsModalList[index].description}",
                              size: 14,
                              color: Colors.grey.shade700, h: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
          },),
      );
    });
}}
