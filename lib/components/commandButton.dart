import 'package:flutter/material.dart';

class CommandButton extends StatelessWidget{

  final VoidCallback callback;
  CommandButton(this.callback, {Key key}) : super(key: key);
  static const List<Color> onPressedColor = [Color(0xFF6f86d6), Color(0xFF48c6ef)];
  static const List<Color> normalColor = [Color(0xFF48c6ef), Color(0xFF6f86d6)];

  @override
  Widget build(BuildContext buildContext){
    return Container(
      margin: EdgeInsets.only(bottom: 10.00),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: InkWell(
              onTap: (){
                //Write the callback function here
                print("REQUEST MISSION BUTTON PRESSED");
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(50.0),
                  gradient: LinearGradient(
                    colors: normalColor,
                  ),
                ),
                padding: const EdgeInsets.only(left: 55.0, right: 55.0, top: 20.0, bottom: 20.0),
                child: const Text(
                  'REQUEST MISSION',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)
                ),
              )
            ),
          ),
        )
      ),
    );
  }
}