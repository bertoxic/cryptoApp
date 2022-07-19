
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/dimensions.dart';
import 'package:shopping/shopping/bigfont.dart';
import 'package:shopping/shopping/smalltext.dart';
import 'package:shopping/shopping/widget/glassCard.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      padding: EdgeInsets.symmetric(horizontal: 10).copyWith(top: 40),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,end: Alignment.bottomCenter,
              colors: [Color(0xff240865),Color(0xff171616),
              //colors: [Color(0xff55599f),Color(0xff111350)
        ]
          )),
      child: Column(
        children: [
          Container( height: 260,
            child: GlassCard(padding: 8, backgroundcolor: Colors.orangeAccent,radius: 20,
                  child:Stack(
                    children: [
                      Positioned( top:20, left: 8,right: 8,
                        child: Column(
                          children: [
                            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              BigText('Credit',size: 16,),
                              Column(children: [
                                Icon(Icons.filter_b_and_w,color: Colors.deepOrange,size: 48,),
                                BigText('crps Bank',size: 14,)
                              ],

                              )
                              //BigText('hello',size: 16,)
                            ],),
                          ],
                        ),
                      ),
                      Positioned( top: 160,left: 280,right: 8,
                          child: Container(
                              child:Row(children: [
                                Icon(Icons.circle,color: Colors.white60,size: 64,)
                              ],)
                          )),
                      Positioned( top: 160,left: 310,right: 8,
                          child: Container(
                              child:Row(children: [
                                Icon(Icons.circle,color: Colors.white60,size: 64,)
                              ],)
                          )),
                      Positioned( top: 110,left: 50,right: 8,
                          child: Container(
                              child:Row(children: [
                                BigText('5399  2384  4539  1039')
                              ],)
                          )),
                      Positioned( top: 180,left: 8,right: 8,
                          child: Container(
                              child:Row(children: [
                                SmallTxt('11/25',color: Colors.grey,)
                              ],)
                          )),
                      Positioned( top: Dimensions.height100*2,left: 8,right: 8,
                          child: Container(
                              child:Row(children: [
                                SmallTxt('Oraezu Albert Chukwuemeka',color: Colors.grey,)
                              ],)
                          )),
                    ],
                  ) ,
            ),
          )
        ],
      ),
    ),
    );
  }
}
