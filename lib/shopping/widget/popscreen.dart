

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping/dimensions.dart';
import 'package:shopping/shopping/bigfont.dart';
import 'package:shopping/shopping/smalltext.dart';
import 'package:shopping/shopping/widget/glassCard.dart';

class PopScreen extends StatefulWidget {
  const PopScreen({Key? key}) : super(key: key);

  @override
  State<PopScreen> createState() => _PopScreenState();
}
AnimationController? control;
Animation? animate;
PageController _pageController=PageController(viewportFraction: 0.54,keepPage: false,initialPage: 0);
var _currentPage= 0.0;
var _scaleFactor=0.8;
var _height=200;
class _PopScreenState extends State<PopScreen> with TickerProviderStateMixin{
  @override
  void initState() {
    control=AnimationController(duration:Duration(seconds: 2),vsync: this);
    animate= ColorTween(begin:Colors.yellow.withOpacity(0), end: Colors.purpleAccent).animate(control!);
    control?.forward();
    control?.addListener(() { setState(() {

    });});
    _pageController.addListener(() {
      setState(() {
        _currentPage=_pageController.page!;
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return 
        Container( height: 320, width:MediaQuery.of(context).size.width,
          child: PageView.builder( itemCount: 4, controller: _pageController,
              itemBuilder: (context, index) {
            return _buildPage(index);
          }),
        );
  }
}



  Widget _buildPage(int index ) {
  Matrix4 matrix =Matrix4.identity();
  if(index==_currentPage.floor()){
    var currScale=1 - (_currentPage-index)*(1-_scaleFactor);
    var currTrans= _height*(1-currScale)/2;
    matrix= Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
  }else if(index==_currentPage.floor()+1){
    var currScale= _scaleFactor + ((_currentPage-index + 1)*(1 - _scaleFactor));
    var currTrans= _height*(1-currScale)/2;
    matrix= Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
  }else if(index<_currentPage.floor()-1){
    var currScale= _scaleFactor + ((_currentPage-index - 1)*(1 - _scaleFactor));
    var currTrans= _height*(1-currScale)/2;
    matrix= Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
  }else{
    var currScale=0.8;
    matrix= Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
  }
    return Transform(
      transform: matrix,
      child: Container( margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column( mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container( height: 220, width: 210,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,
                    colors: [ animate?.value,
                      // Colors.purpleAccent,
                      //Colors.amber,
                      //Colors.orangeAccent,
                      Colors.deepOrange,
                    ]),
                borderRadius: BorderRadius.circular(20).copyWith(bottomRight: Radius.circular(0),bottomLeft: Radius.circular(0)),
              ),
              child: Stack( alignment: AlignmentDirectional.topStart, clipBehavior: Clip.none,
                children: [
                  Positioned(top:10,right:8,left:8,child: Container( margin: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                    child: Container( color: Colors.transparent,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        BigText('Ethereum',size: 16,color: Colors.grey.shade200,),
                        //SizedBox(width: Dimensions.width30*3.5,),
                        SmallTxt('ETH',size: 14,color: Colors.grey.shade100,),
                       // SizedBox(height: 150,),
                      ],),
                    ),) ),
                  Positioned(top: 180,left: 8,right: 8,
                      child: Container(
                          child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(FontAwesomeIcons.ethereum,size: 28,color: Colors.white,),
                            Column( crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SmallTxt('increase',size: 14,color: Colors.grey.shade300,),
                                SmallTxt('value: \$23,451',size: 14,color: Colors.grey.shade100,),
                              ],
                            )

                            ],)
                      )),

                ],
              ),
            ),

            Container(  height: 68, width: 210,
              padding: EdgeInsets.symmetric(horizontal:8,vertical: 5),
              decoration: BoxDecoration(color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20).copyWith(topRight: Radius.circular(0),topLeft: Radius.circular(0)),
              ),
              child: Row( mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmallTxt('price in usd:',h: 1.2,color: Colors.grey.shade800,),
                        SizedBox(height: 4,),
                        Expanded(child: Container(child: BigText('\$7 342.80',size: 18,color: Colors.grey.shade800,fw: FontWeight.w800,))),
                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
