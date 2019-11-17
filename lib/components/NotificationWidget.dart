import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationModel notificationModel;

  const NotificationWidget(this.notificationModel);

  @override
  Widget build(BuildContext context) {
    Color mColor;

    switch (notificationModel.importance) {
      case NotificationType.STRONG_WARNING:
        mColor = Colors.deepOrangeAccent;
        break;
      case NotificationType.LOW_WARNING:
        mColor = Colors.amberAccent;
        break;
      case NotificationType.GOOD_NEWS:
        mColor = Colors.lightGreenAccent;
        break;
    }

    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            width: 350.0,
            height: 100.0,
            margin: EdgeInsets.only(top: 60.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: new BoxDecoration(
              color: mColor,
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
                  notificationModel.dateTime.hour.toString() +
                      ":" +
                      notificationModel.dateTime.minute.toString() +
                      " - " +
                      notificationModel.message,
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
  final NotificationType importance;
  final int displayDuration;

  NotificationModel(this.id, this.dateTime, this.message, this.importance,
      this.displayDuration);
}

enum NotificationType { STRONG_WARNING, LOW_WARNING, GOOD_NEWS }
