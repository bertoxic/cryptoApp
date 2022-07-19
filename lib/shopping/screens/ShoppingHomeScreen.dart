import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopping/dimensions.dart';
import 'package:shopping/shopping/bigfont.dart';
import 'package:shopping/shopping/smalltext.dart';
import 'package:shopping/shopping/widget/bottombar/buttomnavigationBar.dart';
import 'package:shopping/shopping/widget/popscreen.dart';
import 'package:shopping/shopping/widget/transactions.dart';

class ShoppingHomeScreen extends StatelessWidget {
  const ShoppingHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration( //image: DecorationImage(image: AssetImage('assets/newsphoto/pattern.jpg',),fit:BoxFit.cover),
          gradient: LinearGradient(
              begin: Alignment.topLeft,end: Alignment.bottomCenter,
              colors: [Color(0xff240865),Color(0xff171616)
              //colors: [Color(0xff55599f),Color(0xff111350)
              ]
          )),
        padding: EdgeInsets.all(20).copyWith(top: 50),
        child: (Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container( padding: EdgeInsets.only(bottom: Dimensions.width5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        "Hi Gold",color: Colors.grey.shade200,
                      ),
                      SmallTxt("What would you want to do today?",h: 1.8,
                          color: Colors.grey.shade400),
                    ],
                  ),
                ),
                Icon(
                  Icons.notifications_none_outlined,color: Colors.grey.shade200,
                  size: 24,
                )
              ],
            ),
            // Container(
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: SingleChildScrollView( scrollDirection: Axis.horizontal,
            //           child:
            //               SpecialOfferCard(),
            //               //PopScreen(),
            //
            //
            //
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: Dimensions.height30,),
            Container( padding: EdgeInsets.only(bottom: Dimensions.width5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    "Market",color: Colors.grey.shade200,
                  ),
                  SmallTxt("show more",
                      color: Colors.grey.shade400),
                ],
              ),

            ),
            SizedBox(height: Dimensions.height30,),
            SingleChildScrollView( scrollDirection: Axis.horizontal,reverse: true,
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  PopScreen(),
                  // PopScreen(),
                  // PopScreen(),

              ],),
            ),
            SizedBox(height: Dimensions.height20,),
            Container( padding: EdgeInsets.only(bottom: Dimensions.width5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    "Your recent Transactions",size:18,color: Colors.grey.shade300,
                  ),
                  SmallTxt("show more",
                      color: Colors.grey.shade400),
                ],
              ),

            ),
            SizedBox(child:Divider(thickness: 1,color: Colors.grey,),height: Dimensions.height20,),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Transactscreen(),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
        ),
      ),
      bottomNavigationBar: BottomNavigation()
    );
  }
}
