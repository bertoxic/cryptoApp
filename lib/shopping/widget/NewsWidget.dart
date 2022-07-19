

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  NewsCard({required this.backgroundcolor, this.radius=5, this.padding=4,this.child,
    this.marginV=5,this.marginH=4,this.height,this.width,
    Key? key}) : super(key: key);
  Color backgroundcolor =Colors.green;
  double? radius;
  double? padding;
  Widget? child;
  double? marginV;
  double? marginH;
  double? height;
  double? width;
  //BorderRadiusGeometry? radius;


  @override
  Widget build(BuildContext context) {
    return Container( height: height, width: width,
      margin: EdgeInsets.symmetric(horizontal:marginH!,vertical:marginV!  ),
      padding: EdgeInsets.all(padding!),
      decoration: (BoxDecoration(
        color: backgroundcolor,
        borderRadius:BorderRadius.circular(radius!),
      )),
      child:child ,
    );
  }
}
