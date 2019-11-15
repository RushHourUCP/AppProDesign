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
        width: 60.0,
        height: 80.0,
        color: Colors.transparent,
        child: Column(
          children: <Widget>[ 
            Container(
              height: 60.0,
              width: 60.0,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black12,
              ),
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