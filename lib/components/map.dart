import 'package:flutter/material.dart';

class Map extends StatelessWidget{

  const Map({Key key}) : super(key: key);

  @override
  Widget build(BuildContext buildContext){
    return MaterialApp(
      home: Scaffold(
        body: Image.asset('assets/images/meaoocity.png'), //   <-- image
      ),
    );
  }
}