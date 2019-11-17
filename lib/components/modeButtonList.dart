import 'package:app_pro_design/components/modeButton.dart';
import 'package:flutter/material.dart';

class ModeButtonList extends StatefulWidget {
  ModeButtonList({Key key}) : super(key: key);
  final _ModeButtonListState _modeButtonListState = _ModeButtonListState();

  @override
  _ModeButtonListState createState() => _modeButtonListState;

  void setOnOneButtonEnabled(Function callback) {
    _modeButtonListState.callback = callback;
  }

  String getSelectedMode() {
    for (ModeButtonModel button in _modeButtonListState.buttons) {
      if (button.isSelected) return button.label;
    }
    return "";
  }
}

class _ModeButtonListState extends State<ModeButtonList> {
  List<ModeButtonModel> buttons = new List<ModeButtonModel>();
  List<String> transports = ["walk", "bike", "subway", "car"];
  List<IconData> icons = [
    Icons.directions_walk,
    Icons.directions_bike,
    Icons.directions_subway,
    Icons.directions_car
  ];

  Function callback;

  @override
  void initState() {
    super.initState();
    buttons.add(new ModeButtonModel(transports[0], icons[0], true));
    for (int i = 1; i < 4; i++) {
      buttons.add(new ModeButtonModel(transports[i], icons[i], false));
    }
  }

  @override
  Widget build(BuildContext buildContext) {
    return Container(
        width: 300.0,
        height: 100.0,
        padding: EdgeInsets.only(top: 15.0, left: 10.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: buttons.length,
              itemBuilder: (BuildContext context, int index) {
                return new InkWell(
                  onTap: () {
                    setState(() {
                      buttons.forEach((element) => element.isSelected = false);
                      buttons[index].isSelected = true;
                      callback(buttons[index]);
                    });
                  },
                  child: ModeButton(buttons[index]),
                );
              }),
        ));
  }
}
