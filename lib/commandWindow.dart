import 'package:app_pro_design/components/commandButton.dart';
import 'package:app_pro_design/components/modeButtonList.dart';
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

  void callback(){
    print("BUTTON PRESSED");
  }

  @override 
  Widget build(BuildContext context){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 350.0,
        height: 200.0,
        margin: EdgeInsets.only(bottom: 30.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: ModeButtonList(),
                ),
                Flexible(
                  child: CommandButton(callback),
                ),
              ],
            )
          )
        )
      ));
  }
}