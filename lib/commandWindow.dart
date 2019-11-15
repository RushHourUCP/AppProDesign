import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*
  Description of the Command Window
*/

class CommandWindow extends StatefulWidget {
  CommandWindow({Key key}) : super(key: key);
  @override
  _CommandWindowState createState() => _CommandWindowState();
}

class _CommandWindowState extends State<CommandWindow> {
  final _modeButtonList = <Widget>[];

  @override 
  Widget build(BuildContext context){
    return Center(
      child: Container(
        width: 360.0,
        margin: EdgeInsets.only(top: 500.0, bottom: 30.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Stack(
              children: <Widget>[
                _buildModeButtonList()
              ],
            )
          )
        )
        //_buildModeButtonList(),
    ));
  }

  Widget _buildModeButtonList(){
    return ListView(
      padding: EdgeInsets.only(top: 10.0, left: 10),
      children: _getModeButtons(),
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _buildModeButton(String text, AssetImage icon){
    return Container(
      width: 50.0,
      //height: 62.0,
      margin: EdgeInsets.only(right: 15.0),
      color: Colors.blue,
      child: Column(
        children: <Widget>[ 
          Container(
            height: 50.0,
            width: 50.0,
            color: Colors.orange,
          ),
          Text(
            text, 
            style: TextStyle(
              fontSize: 14.0, 
              fontWeight: FontWeight.w300
            )
          )
        ]
      )
    );
  }

  List<Widget> _getModeButtons(){
    List<Widget> buttons = [];
    for(int i=0; i<20; i++){
      buttons.add(_buildModeButton("mode $i", null));
    }
    return buttons;
  }
}