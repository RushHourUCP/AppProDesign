import 'package:flutter/material.dart';

class AgentDisplay extends StatelessWidget{

  final String mobility;
  final Offset point;
  final double width;
  final double height;

  const AgentDisplay(
    this.mobility, 
    this.point, 
    this.width, 
    this.height,  
    {Key key}) : super(key: key);

  

  @override
  Widget build(BuildContext context){
    print('lib/asset/images/' + mobility + '.png');
    print(width/22*point.dx);
    return Positioned(
      left: point.dx*width/12 + width/2 +30,
      //left: 12/width*-6 +12/width*point.dx,
      top: height/6*point.dy + height/2 ,
      width: 30,
      height: 30,
      child: 

        Image.asset(
          'lib/asset/images/' + mobility + '.png',
        )
    ) ;
  }
}