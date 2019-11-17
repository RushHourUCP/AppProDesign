import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationModel notificationModel;

  const NotificationWidget(this.notificationModel);

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
              color: (notificationModel.importance ==
                  NotificationImportance.HIGH) ?
              Colors.deepOrangeAccent :
              Colors.amberAccent,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(children: <Widget>[
              Text(
                notificationModel.id,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  notificationModel.dateTime.hour.toString()
                      + ":" + notificationModel.dateTime.minute.toString()
                      + " - " + notificationModel.message,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ])));
  }
}

class NotificationModel {
  final String id;
  final DateTime dateTime;
  final String message;
  final NotificationImportance importance;

  NotificationModel(this.id, this.dateTime, this.message, this.importance);
}

enum NotificationImportance {
  HIGH,
  LOW
}
