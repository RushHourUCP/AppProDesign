class Agent{
  var position;
  var objective;
  var vehicle;
  var path;

  Agent(this.position, this.objective, this.vehicle, this.path);

  void setPosition(var position){this.position = position;}

  void setObjective(var objective){this.objective = objective;}

  void setVehicle(var vehicle){this.vehicle = vehicle;}

  void setPath(var path){this.path = path;}
}