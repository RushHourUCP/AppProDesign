import 'package:flutter/material.dart';

class Map extends StatelessWidget{
  final double height;
  const Map(this.height,{Key key}) : super(key: key);

  

  @override
  Widget build(BuildContext context){
    return Image.asset(
      'lib/asset/images/meaoocity.png',
      height: height,
      fit : BoxFit.fitHeight
      
      );
  }
}