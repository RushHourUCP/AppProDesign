import 'package:app_pro_design/components/modeButton.dart';
import 'package:flutter/material.dart';

class ModeButtonList extends StatefulWidget{

  ModeButtonList({Key key}) : super(key: key);

  @override
  _ModeButtonListState createState() => _ModeButtonListState();
}

class _ModeButtonListState extends State<ModeButtonList>{
  
  @override
  Widget build(BuildContext buildContext){
    return ListView(
      padding: EdgeInsets.only(top: 10.0, left: 10),
      children: _getModeButtons(),
      scrollDirection: Axis.horizontal,
    );
  }

  List<Widget> _getModeButtons(){
    List<Widget> buttons = [];
    for(int i=0; i<20; i++){
      buttons.add(new ModeButton("mode$i", null));
    }
    return buttons;
  }
}