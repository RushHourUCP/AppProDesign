import 'package:flutter/material.dart';

class MyPainter extends CustomPainter{
  List<Offset> points = new List();

  
  MyPainter(List<Offset> newPoints, double dx, double dy){

    newPoints.forEach((point) => points.add(Offset(dx/6*point.dx, dy/22*point.dy)));
    //newPoints.forEach((point) => this.points.add(Offset(dx/2, dy/2)));
    //this.points = newPoints;
  }


  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;

    // canvas.drawLine(Offset(0, 0), Offset(200, 200), paint);
    // canvas.drawLine(Offset(200, 200), Offset(400, 20), paint);


    for (var i = 1; i < points.length; i++) {
      
      canvas.drawLine(points[i-1], points[i], paint);
      print(points[i].dx);print(points[i].dy);print("tesit");
      
    }
    
    


   
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return null;
  }
}