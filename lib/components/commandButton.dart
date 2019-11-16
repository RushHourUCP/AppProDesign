import 'package:flutter/material.dart';

class CommandButton extends StatelessWidget{

  const CommandButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext buildContext){
    return Container(
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(50.0),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF48c6ef),
                    Color(0xFF6f86d6),
                  ],
                ),
              ),
              padding: const EdgeInsets.only(left: 55.0, right: 55.0, top: 20.0, bottom: 20.0),
              child: const Text(
                'REQUEST MISSION',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)
              ),
            ),
          ),
        )
      ),
    );
  }
}