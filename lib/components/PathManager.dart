import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:app_pro_design/components/request.dart';

enum vehicleType {
  walk,
  subway,
  car,
  bike,
}

class Point {
  double x,y;
}

class PathManager {
  List<Point> path;
  
  double getPath(vehicleType vehicle) {
    // Return path cost
    switch (vehicle) {
      case vehicleType.walk:

          
      case vehicleType.subway:

      case vehicleType.car:

      case vehicleType.bike:
          
        break;
      default:
    }
  }
}