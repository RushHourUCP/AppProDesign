import 'package:flutter/material.dart';

class ModeButton extends StatefulWidget {
  final String text;
  final AssetImage icon;
  ModeButton(this.text, this.icon, {Key key}) : super(key: key);
  @override
  _ModeButtonState createState() => _ModeButtonState();
}

class _ModeButtonState extends State<ModeButton>{

  @override
  Widget build(BuildContext context){
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        width: 50.0,
        height: 70.0,
        color: Colors.blue,
        child: Column(
          children: <Widget>[ 
            Placeholder(
              fallbackHeight: 50.0,
              fallbackWidth: 50.0,
              color: Colors.orange,
            ),
            Text(
              widget.text, 
              style: TextStyle(
                fontSize: 14.0, 
                fontWeight: FontWeight.w300
              )
            )
          ]
        )
      ),
    );
  }
}