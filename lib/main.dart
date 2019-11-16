import 'dart:async';

import 'package:app_pro_design/commandWindow.dart';
import 'package:app_pro_design/components/mapWindow.dart';
import 'package:flutter/material.dart';

import 'components/EventWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State<StatefulWidget> createState() {
    final myAppState = _MyAppState();

    // TODO: Subscribe to real events instead
    new Timer.periodic(
        Duration(seconds: 20), (Timer t) => {myAppState.displayNewEvent()});

    return myAppState;
  }
}

class _MyAppState extends State<MyApp> {
  List<Widget> stackedChildren = [MapWindow(), CommandWindow()];

  void onMissionRequested(){
    print("BUTTON PRESSED");
  }

  void displayNewEvent() {
    print("Displaying new event...");
    EventWidget event = EventWidget(
        "Event type", DateTime.now(),
        "Message that gives information about what happened.");

    setState(() {
      stackedChildren.add(event);
    });

    new Future.delayed(
        const Duration(seconds: 10),
            () =>
            setState(() {
              stackedChildren.remove(event);
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
}