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

  final _CommandWindowState commandWindowState = _CommandWindowState();

  @override
  _CommandWindowState createState() {
    return commandWindowState;
  }

  final List<MissionRequestListener> _missionRequestListeners = [];

  final List<SelectedModeChangedListener> _selectedModeChangedListeners = [];

  void addMissionRequestListener(MissionRequestListener listener) {
    _missionRequestListeners.add(listener);
  }

  void _notifyMissionRequestListeners() {
    for (MissionRequestListener listener in _missionRequestListeners) {
      listener.onMissionRequested();
    }
  }

  void addOnSelectedModeChangedListener(SelectedModeChangedListener listener) {
    _selectedModeChangedListeners.add(listener);
  }

  void _notifySelectedModeChangedListeners(ModeButtonModel modeButton) {
    for (SelectedModeChangedListener listener
    in _selectedModeChangedListeners) {
      listener.onSelectedModeChangedListener(modeButton);
    }
  }

  void enableMissionLaunchButton(bool boolean) {
    commandWindowState.missionStartButton.setEnabled(boolean);
  }
}

abstract class SelectedModeChangedListener {
  void onSelectedModeChangedListener(ModeButtonModel modeButton);
}

class _CommandWindowState extends State<CommandWindow> {
  List<Widget> children = <Widget>[];
  ModeButtonList modeButtonList = ModeButtonList();
  CommandButton missionStartButton = CommandButton();

  double height = 200.0;

  void onMissionRequestButtonClicked() {
    widget._notifyMissionRequestListeners();
    hideMissionRequestButton();
  }

  void onSelectedButtonChanged(ModeButtonModel modeButton) {
    widget._notifySelectedModeChangedListeners(modeButton);
  }

  void enableMissionRequestButton() {
    // If button displayed on screen
    if (children.contains(missionStartButton)) {
      missionStartButton.setEnabled(true);
    }
  }

  @override
  void initState() {
    super.initState();
    modeButtonList.setOnOneButtonEnabled(onSelectedButtonChanged);
    children.add(modeButtonList);
    missionStartButton.setOnButtonTaped(onMissionRequestButtonClicked);
    children.add(missionStartButton);
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
      children.remove(missionStartButton);
      height = 110.0;
    });
  }
}
