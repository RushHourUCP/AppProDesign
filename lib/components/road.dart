import 'package:flutter/material.dart';

class Road extends StatelessWidget{

  const Road({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Image.asset(
      'lib/asset/images/meaoocity.png',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit:BoxFit.fill
      );
  }
}