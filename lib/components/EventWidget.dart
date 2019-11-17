import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final EventModel eventModel;

  const EventWidget(this.eventModel);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            width: 350.0,
            height: 100.0,
            margin: EdgeInsets.only(top: 60.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: new BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(children: <Widget>[
              Text(
                eventModel.id,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  eventModel.dateTime.hour.toString()
                      + ":" + eventModel.dateTime.minute.toString()
                      + " - " + eventModel.message,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ])));
  }
}

class EventModel {
  final String id;
  final DateTime dateTime;
  final String message;
  final EventImportance importance;

  EventModel(this.id, this.dateTime, this.message, this.importance);
}

enum EventImportance {
  HIGH,
  LOW
}
