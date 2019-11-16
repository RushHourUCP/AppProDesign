import 'package:app_pro_design/components/modeButton.dart';
import 'package:flutter/material.dart';

class ModeButtonList extends StatefulWidget{

  final List<Widget> buttons = initButtonList(4);

  static List<Widget> initButtonList(int number) {
     List<Widget> buttons = [];
    for(int i=0; i<number; i++){
      buttons.add(new ModeButton("mode$i", null));
    }
    return buttons;
  }
  ModeButtonList({Key key}) : super(key: key);

  @override
  _ModeButtonListState createState() => _ModeButtonListState();
}

class _ModeButtonListState extends State<ModeButtonList>{
  
  @override
  Widget build(BuildContext buildContext){
    return Container(
        padding: EdgeInsets.only(top: 15.0, left: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getModeButtons(),
        ),
    );
  }

  List<Widget> _getModeButtons(){
   return widget.buttons;
  }
}