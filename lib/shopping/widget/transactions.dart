import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/shopping/widget/glassCard.dart';
import '../../dimensions.dart';
import '../CardWidget.dart';
import '../bigfont.dart';
import '../smalltext.dart';

class Transactscreen extends StatelessWidget {
  const Transactscreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> myOffer=[
      "732 btc sent to 0xcbbc23337688",
      "519 trx on pending",
      "122 eth sent to 0xf4558921tty88900nvbdt88",
      "900 btc received from 0xdb34uc74nu48jv89",
      "732 btc sent to 0xcbbc23337688",
      "Transactions here is private",
    ];
    final myProducts = List<String>.generate(10, (i) => 'product $i');

    return ListView.builder( itemCount: myOffer.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        return
          Column(
            children: [
              GlassCard(height:Dimensions.height100*0.8,width: Dimensions.width20*20,
                padding: 8,
                backgroundcolor: Color(0xfff3f3f6).withOpacity(0.4),
                child: Container(
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: BigText(myOffer[index],size: 18,color: Color(
                        0xF0EFEBEB),),
                      ),

                     Flexible(
                       child: SmallTxt(
                         "At 15th -25th august 2023",h: 1.8,
                         size: 14,
                         color: Color(0xd2b98e8e),
                       ),
                     ),
                    ],
                  ),
                ),
              ),
            ],
          );
      },);
  }
}
