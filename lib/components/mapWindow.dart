import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MapWindow extends StatelessWidget {

@override 
  Widget build(BuildContext context){
    //return Image(image: AssetImage('lib/assets/images/meaoocity.png'));
    return Image.asset(
      'lib/asset/images/meaoocity.png',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit:BoxFit.fill
      );
  }
}