import 'package:app_pro_design/components/modeButton.dart';
import 'package:flutter/material.dart';

class ModeButtonList extends StatefulWidget{
  ModeButtonList({Key key}) : super(key: key);

  @override
  _ModeButtonListState createState() => _ModeButtonListState();
}

class _ModeButtonListState extends State<ModeButtonList>{

  List<ModeButtonModel> buttons = new List<ModeButtonModel>();
  List<String> transports = ["Walk", "Bike", "Subway", "Car"];

  @override
  void initState(){
    super.initState();
    for(int i=0; i<4; i++){
      buttons.add(new ModeButtonModel(transports[i], null, false));
    }
  }
  
  @override
  Widget build(BuildContext buildContext){
    return Container(
        padding: EdgeInsets.only(top: 15.0, left: 15.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: buttons.length,
            itemBuilder: (BuildContext context, int index){
              return new InkWell(
                onTap: (){
                  setState(() {
                    buttons.forEach((element) => element.isSelected = false);
                    buttons[index].isSelected = true;
                  });
                },
                child: ModeButton(buttons[index]),
              );
            }
          ),
        )
    );
  }
}