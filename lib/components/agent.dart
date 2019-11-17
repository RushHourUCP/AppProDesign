import 'dart:convert';

import 'package:mqtt_client/mqtt_client.dart';

class Agent{
  var position;
  var objective;
  String vehicle;
  var path;
  bool isRunning = false;
  final MqttClient client = MqttClient('mr1dns3dpz5mjj.messaging.solace.cloud', '');

  Agent(this.position, this.objective, this.vehicle, this.path);

  void setPosition(var position){this.position = position;}

  void setObjective(var objective){this.objective = objective;}

  void setVehicle(var vehicle){this.vehicle = vehicle;}

  void setPath(var path){this.path = path;}

  Future<int> run() async{
    client.onConnected = onConnected;
    var message = {};
    var target = {};
    var jsonString;

    try {
      await client.connect("team08", "di34zlpjto");
    } on Exception catch (e) {
      print('client exception - $e');
      client.disconnect();
    }

    message['vehicle_type'] = this.vehicle;
    target['x'] = this.objective['x'];
    target['y'] = this.objective['y'];
    message['target'] = target;

    jsonString = json.encode(message);
    client.publishMessage("team08/prod/user/path", MqttQos.exactlyOnce, jsonString.payload);

    client.disconnect();
  }

  void stop(){
    //TODO: Stop the agent
  }

  void onConnected(){
    print("AGENT - Connected to MQTT Broker");
  }
}