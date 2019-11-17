import 'package:mqtt_client/mqtt_client.dart';

class Agent{
  var position;
  var objective;
  var vehicle;
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
    try {
      await client.connect("team08", "di34zlpjto");
    } on Exception catch (e) {
      print('client exception - $e');
      client.disconnect();
    }

    while(isRunning){
      // TODO: write payload
      var message;

      client.publishMessage("team08/prod/user/path", MqttQos.exactlyOnce, message.payload);
    }
  }

  void stop(){
    this.isRunning = false;
  }

  void onConnected(){
    print("AGENT - Connected to MQTT Broker");
  }
}