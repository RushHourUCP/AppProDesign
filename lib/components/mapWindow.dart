import 'package:app_pro_design/components/map.dart' as prefix0;
import 'package:app_pro_design/components/painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MapWindow extends StatelessWidget {

  // final customPaint = CustomPaint(
    
  //   painter: MyPainter([Offset(0, 0), Offset(800, 800)]),
  //   child: Road(),
  // );
  final List<Offset> points;

  MapWindow(this.points, {Key key}) : super(key: key);

@override 
  Widget build(BuildContext context){
    //return Image(image: AssetImage('lib/assets/images/meaoocity.png'));
    return Stack(
      children: <Widget>[
        prefix0.Map(),
        Container(),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child : CustomPaint(
            painter: MyPainter(points, MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
            child: Container(
            ),
          )
        ),
      
      ],
    );
    
  }
}