import 'package:flutter/material.dart';

class MyPainter extends CustomPainter{
  List<Offset> points = new List();

  double width;
  double height;
  
  MyPainter(List<Offset> newPoints, double dx, double dy){
    width = dx;
    height = dy;
    newPoints.forEach((point) => points.add(Offset(dx/6*point.dx + 15, dy/22*point.dy+15)));
    //newPoints.forEach((point) => this.points.add(Offset(dx/2, dy/2)));
    //this.points = newPoints;
  }


  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10;

    // canvas.drawLine(Offset(0, 0), Offset(200, 200), paint);
    // canvas.drawLine(Offset(200, 200), Offset(400, 20), paint);


    for (var i = 1; i < points.length; i++) {
      
      canvas.drawLine(points[i-1], points[i], paint);
      
    }
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return null;
  }
}