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
    return Positioned(
      left: width/6*point.dx - 15,
      top: height/22*point.dy - 15,
      width: 30,
      height: 30,
      child: 

        Image.asset(
          'lib/asset/images/' + mobility + '.png',
        )
    ) ;
  }
}