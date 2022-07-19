import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  GlassCard({this.backgroundcolor=Colors.white, this.radius=5, this.padding=4,this.child,
    this.marginV=5,this.marginH=5,this.height,this.width,
    Key? key}) : super(key: key);
  Color backgroundcolor =Colors.white.withOpacity(0.03);
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
    return ClipRRect( borderRadius: BorderRadius.circular(radius!),
      child: Container( width: width, height: height,
        margin: EdgeInsets.symmetric(horizontal:marginH!,vertical:marginV!  ),

        decoration: (BoxDecoration( borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0),
        )),
        child:Stack(
          children: [
            BackdropFilter(filter: ImageFilter.blur(sigmaX: 10,sigmaY:4),
              child: Container(),
            ),
            Container( height: height, width: width,

              padding: EdgeInsets.all(padding!),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius!),
                  border: Border.all(color: Colors.white.withOpacity(0.13)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    backgroundcolor.withOpacity(0.08),
                    backgroundcolor.withOpacity(0.18),

                  ],
                )
              ),
              child: child,
            )
          ],
        ) ,
      ),
    );
  }
}
