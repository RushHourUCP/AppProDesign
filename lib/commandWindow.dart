import 'package:app_pro_design/components/commandButton.dart';
import 'package:app_pro_design/components/modeButton.dart';
import 'package:app_pro_design/components/modeButtonList.dart';
import 'package:app_pro_design/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*
  Description of the Command Window
*/

class CommandWindow extends StatefulWidget {
  CommandWindow({Key key}) : super(key: key);

  @override
  _CommandWindowState createState() => _CommandWindowState();

  final List<MissionRequestListener> _missionRequestListeners = [];

  final List<SelectedModeChangedListener> _selectedModeChangedListeners = [];

  void addMissionRequestListener(MissionRequestListener listener) {
    _missionRequestListeners.add(listener);
  }

  void notifyMissionRequestListeners() {
    for (MissionRequestListener listener in _missionRequestListeners) {
      listener.onMissionRequested();
    }
  }

  void addOnSelectedModeChangedListener(SelectedModeChangedListener listener) {
    _selectedModeChangedListeners.add(listener);
  }

  void notifySelectedModeChangedListeners(ModeButtonModel modeButton) {
    for (SelectedModeChangedListener listener in _selectedModeChangedListeners) {
      listener.onSelectedModeChangedListener(modeButton);
    }
  }
}

abstract class SelectedModeChangedListener {
  void onSelectedModeChangedListener(ModeButtonModel modeButton);
}

class _CommandWindowState extends State<CommandWindow> {
  List<Widget> children = <Widget>[];
  ModeButtonList modeButtonList = ModeButtonList();
  CommandButton missionRequestButton = CommandButton();

  double height = 200.0;

  void onMissionRequestButtonClicked() {
    widget.notifyMissionRequestListeners();
    hideMissionRequestButton();
  }

  void onSelectedButtonChanged(ModeButtonModel modeButton) {
    //TODO call enableMissionRequestButton when the mission is retrieved instead
    enableMissionRequestButton();
    widget.notifySelectedModeChangedListeners(modeButton);
  }

  void enableMissionRequestButton() {
    // If button displayed on screen
    if (children.contains(missionRequestButton)) {
      missionRequestButton.setEnabled(true);
    }
  }

  @override
  void initState() {
    super.initState();
    modeButtonList.setOnOneButtonEnabled(onSelectedButtonChanged);
    children.add(modeButtonList);
    missionRequestButton.setOnButtonTaped(onMissionRequestButtonClicked);
    children.add(missionRequestButton);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: 350.0,
            height: height,
            margin: EdgeInsets.only(bottom: 30.0),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(children: children))));
  }

  void hideMissionRequestButton() {
    setState(() {
      children.remove(missionRequestButton);
      height = 110.0;
    });
  }

}
