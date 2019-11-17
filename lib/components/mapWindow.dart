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
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
          prefix0.Map(),
        
        SizedBox(
          width: width,
          height: height,

          child : CustomPaint(
            painter: MyPainter(points, width, height),
            child: Container(
            ),
          )
        ),
        AgentDisplay("subway", Offset(3,11), width, height),
      
      ],
    );
    
  }
}