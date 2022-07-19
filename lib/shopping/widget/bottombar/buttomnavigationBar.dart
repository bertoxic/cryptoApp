


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shopping/controllers/coin_controller.dart';
import 'package:shopping/shopping/helper/Apiclient/coin_Apiclient.dart';
import 'package:shopping/shopping/helper/repositories/Coinrepo.dart';

import '../../../dimensions.dart';
import '../../helper/repositories/newsrepo.dart';
import '../../navigation/routes.dart';
import '../IconButton.dart';
import '../specialoffer.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container( color: Color(0xff171616),
            height: Dimensions.height30*1.8, padding: EdgeInsets.symmetric(vertical: 8,horizontal: Dimensions.height45),
            child:Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.shipping);
                  },
                  child: IconButt(icon:Icon( FeatherIcons.home,color:Colors.white,),
                    backgroundcolor:Color(0xff111350).withOpacity(0) ,),
                ),
                GestureDetector(onTap: (){
                  Get.toNamed(Routes.walletPage);
                },
                  child: IconButt(icon:Icon( Icons.favorite,color:Colors.white,),
                    backgroundcolor:Color(0xff111350).withOpacity(0),),
                ),
                GestureDetector( onTap: (){
                  Get.toNamed(Routes.newsPage);
                  NewsRepo(apiClient: Get.find()).getNewsList();
                  //CoinRepo(coinApiClient: Get.find()).getCoinPrice();
                  Get.find<CoinController>().getCoinList();
                },
                  child: IconButt(icon:Icon( Icons.file_copy_outlined,color:Colors.white,),
                    backgroundcolor:Color(0xff111350).withOpacity(0) ,),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.dashBoard);
                  },
                  child: IconButt(icon:Icon( Icons.format_line_spacing_rounded,color:Colors.white,),
                    backgroundcolor:Color(0xff111350).withOpacity(0) ,),
                )
              ],
            )
        ),

      ],
    );
  }
}

