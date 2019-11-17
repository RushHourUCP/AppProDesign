import 'package:app_pro_design/components/agentDisplay.dart';
import 'package:app_pro_design/components/map.dart' as prefix0;
import 'package:app_pro_design/components/painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MapWindow extends StatelessWidget {


  final List<Offset> points;

  MapWindow(this.points, {Key key}) : super(key: key);

@override 
  Widget build(BuildContext context){
    
    double width = MediaQuery.of(context).size.height*3.6;
    //double height = MediaQuery.of(context).size.height/2;
    double height = MediaQuery.of(context).size.height/2;




    return 
    Positioned(

      height: height,
      width: width,
      top: -0,
      left: -0,
      child: Stack(
      
      children: <Widget>[
        Positioned(
          child:  prefix0.Map(height),
        ),
         
        
        SizedBox(
          width: width,
          height: height,
          

          child : CustomPaint(
            painter: MyPainter(points,width,height),
            child: Container(
            ),
          )
        ),
        AgentDisplay("subway", Offset(0,-6),width, height-30),
      
      ],
    ),
    
    
     
    ); 
    
  }
}