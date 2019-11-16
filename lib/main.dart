import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:app_pro_design/commandWindow.dart';
import 'package:app_pro_design/components/mapWindow.dart';
import 'package:app_pro_design/components/modeButton.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:http/http.dart' as http;
import 'package:vibration/vibration.dart';
=======
import 'package:mqtt_client/mqtt_client.dart';
>>>>>>> Connecting to MQTT Broker

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
  final MqttClient client = MqttClient('mr1dns3dpz5mjj.messaging.solace.cloud', '');
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

    listenMQTT();
  }

  /* 
    ------------------ Broker Suscription --------------------
  */

  Future<int> listenMQTT() async{
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;

    /// try connecting to the broker
    try {
      await client.connect("team08", "di34zlpjto");
    } on Exception catch (e) {
      print('EXAMPLE::client exception - $e');
      client.disconnect();
    }

    /// Check we are connected
    if (client.connectionStatus.state == MqttConnectionState.connected) {
      print('EXAMPLE::Mosquitto client connected');
    } else {
      /// Use status here rather than state if you also want the broker return code.
      print(
          'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
      exit(-1);
    }

    /// Connecting to topics
    const String topic = 'team08/prod/user/situation'; // Not a wildcard topic
    client.subscribe(topic, MqttQos.atMostOnce);


    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload;
      final String pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      print('EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      print('');
    });

  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    print('EXAMPLE::Subscription confirmed for topic $topic');
  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    print('EXAMPLE::OnDisconnected client callback - Client disconnection');
    if (client.connectionStatus.returnCode == MqttConnectReturnCode.solicited) {
      print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
    }
    exit(-1);
  }

  /// The successful connect callback
  void onConnected() {
    print(
        'EXAMPLE::OnConnected client callback - Client connection was sucessful');
  }

  /// Pong callback
  void pong() {
    print('EXAMPLE::Ping response client callback invoked');
  }


  /* 
    ------------------ API Request --------------------
  */


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

  /* 
    ------------------  Callbacks --------------------
  */

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

    int duration = (importance == EventImportance.HIGH) ? 20 : 10;
    new Future.delayed(
        Duration(seconds: duration),
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
