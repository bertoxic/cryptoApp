import 'package:flutter/cupertino.dart';

class IconButt extends StatelessWidget {
  IconButt ({this.paddin,
    required this.icon,
    this.txt,
    this.backgroundcolor,
    this.iconSize});
  final Icon? icon;
  Text? txt;
  double? iconSize;
  Color? backgroundcolor;
  EdgeInsetsGeometry? paddin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(color: backgroundcolor,
      borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: icon!,
      ),
    );
  }
}
