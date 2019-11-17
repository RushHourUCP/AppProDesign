import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:app_pro_design/commandWindow.dart';
import 'package:app_pro_design/components/mapWindow.dart';
import 'package:app_pro_design/components/modeButton.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vibration/vibration.dart';

import 'components/EventWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  final myAppState = _MyAppState();

  @override
  State<StatefulWidget> createState() {
    // TODO: Subscribe to real events instead
    new Timer.periodic(
        Duration(seconds: 20),
            (Timer t) =>
        {myAppState.displayNewEvent(), myAppState.onMissionRequested()});

    return myAppState;
  }
}

class _MyAppState extends State<MyApp>
    with MissionRequestListener, SelectedModeChangedListener {
  List<Widget> stackedChildren = [];
  final CommandWindow commandWindow = CommandWindow();
  var path;
  var agentSituation;

  @override
  void initState() {
    super.initState();

    stackedChildren.add(MapWindow([Offset(0, 0), Offset(3,0), Offset(3, 11), Offset(0, 11)]));

    commandWindow.addMissionRequestListener(this);
    commandWindow.addOnSelectedModeChangedListener(this);
    stackedChildren.add(commandWindow);

    path = null;
  }

  /*
    Update the situation of the agent
  */
  Future<dynamic> fetchAgentSituation() async {
    var response = await http.get(
        Uri.encodeFull(
            "agent-controller.team08.xp65.renault-digital.com/api/user/situation/last"),
        headers: {"Accept": "application/json"});
    agentSituation = json.decode(response.body);
    return agentSituation;
  }

  /*
    Only for modes: "walk", "bike" and "subway"
  */
  Future<dynamic> fetchPath(String mode, var xDep, var yDep, var yArr,
      var xArr) async {
    var dict = {
      "departure": {"x": xDep, "y": yDep},
      "arrival": {"x": xArr, "y": yArr}
    };
    var body = json.encode(dict);
    String url =
        "http://graph.team08.xp65.renault-digital.com//road_graph/shortest_path/$mode";
    Map headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var response = await http.post(url, body: body, headers: headers);
    path = json.decode(response.body);
  }

  /*
    Only for mode "car"
  */
  /*Future<dynamic> fetchPathForCar(var xDep, var yDep, var yArr, var xArr) async {
    var dict = {"departure": { "x":xDep, "y":yDep }, "arrival": { "x":xArr, "y":yArr }};
    var body = json.encode(dict);
    String url = "http://graph.team08.xp65.renault-digital.com//road_graph/shortest_path/car";
    Map headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    var response = await http.post(url, body: body, headers: headers);
    path = json.decode(response.body);
  }*/

  void onMissionRequested() {
    print("BUTTON PRESSED");
    //TODO
  }

  @override
  void onSelectedModeChangedListener(ModeButtonModel modeButton) {
    print(modeButton.label + " was selected");
    // TODO
  }

  // NOTE: SHOULD NOT BE USED
  void hideCommandWindow() {
    setState(() {
      stackedChildren.remove(commandWindow);
    });
  }

  void displayNewEvent() {
    print("Displaying new event...");

    //TODO: replace by real importance priorization
    EventImportance importance =
    Random().nextInt(10) == 0 ? EventImportance.HIGH : EventImportance.LOW;

    EventModel event = EventModel("Event type", DateTime.now(),
        "Message that gives information about what happened.", importance);

    EventWidget eventWidget = EventWidget(event);

    setState(() {
      stackedChildren.add(eventWidget);
    });

    // Vibrate if the event is important
    if (importance == EventImportance.HIGH) {
      vibratePhone();
      playSound(
          "https://notificationsounds.com/wake-up-tones/system-fault-518/download/mp3",
          3);
    }

    new Future.delayed(
        const Duration(seconds: 10),
            () =>
            setState(() {
              stackedChildren.remove(eventWidget);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobility Rush',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.grey,
        scaffoldBackgroundColor: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: stackedChildren,
        ),
      ),
    );
  }

  AudioPlayer audioPlayer = AudioPlayer();

  void playSound(String url, int times) {
    if (times == 0) return;
    audioPlayer.play(url).then((onValue) {
      playSound(url, times - 1);
    });
  }

  void vibratePhone() {
    print("Vibrating...");
    Vibration.hasVibrator().then((hasVibrator) {
      if (hasVibrator) {
        Vibration.hasAmplitudeControl().then((hasAmplitudeControl) {
          if (hasAmplitudeControl) {
            Vibration.vibrate(duration: 500, amplitude: 125);
          } else {
            Vibration.vibrate();
          }
        });
      }
    });
  }
}

abstract class MissionRequestListener {
  void onMissionRequested();
}
