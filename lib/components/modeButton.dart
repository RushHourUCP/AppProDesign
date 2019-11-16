import 'package:flutter/material.dart';

class ModeButton extends StatelessWidget {
  final ModeButtonModel item;
  ModeButton(this.item, {Key key}) : super(key: key);
  
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
              margin: EdgeInsets.only(bottom: 3.0),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: _getColor(),
              ),
              child: Icon(
                Icons.monetization_on,
                color: Colors.white,
                size: 35.0,
              ),
            ),
            Text(
              item.text, 
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

  Color _getColor(){
    if(item.isSelected){return Colors.black54;}
    else{return Colors.black12;}
  }
}

class ModeButtonModel{
  final String text;
  final AssetImage icon;
  bool isSelected;

  ModeButtonModel(this.text, this.icon, this.isSelected);
}