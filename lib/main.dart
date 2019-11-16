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

    new Timer.periodic(
        Duration(seconds: 20), (Timer t) => {myAppState.displayNewEvent()});

    return myAppState;
  }
}

class _MyAppState extends State<MyApp> {
  List<Widget> stackedChildren = [MapWindow(), CommandWindow()];

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
