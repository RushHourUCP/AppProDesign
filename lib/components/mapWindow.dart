import 'package:app_pro_design/components/agentDisplay.dart';
import 'package:app_pro_design/components/map.dart' as prefix0;
import 'package:app_pro_design/components/painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app_pro_design/main.dart';

// class MapWindow extends StatelessWidget {


//   final List<Offset> points;
//   final Offset agent;
//   final String vehicle;
//   MapWindow(this.points, this.agent, this.vehicle ,{Key key}) : super(key: key);

//   Widget checkPath(double width, height) {
//     if (this.points.isEmpty) {
//       return Container();
//     } else
//       return CustomPaint(
//             painter: MyPainter(points, width, height),
//             child: Container());
//   }

// @override 
//   Widget build(BuildContext context){
//     State<StatefulWidget> parentState = context.ancestorStateOfType(const TypeMatcher<MyAppState>());
//     print(parentState);
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     print("here");
//     return Stack(
//       children: <Widget>[
//           prefix0.Map(),
        
//         SizedBox(
//           width: width,
//           height: height,

//           child : checkPath(width, height),
//           ),
//         AgentDisplay(vehicle, Offset(3,11), width, height),
      
//       ],
//     );
    
//   }
// }

class MapWindow extends StatefulWidget {

	MapWindow({
		Key key
	}): super(key: key);
	
	
	@override
	_MapWindowState createState() => new _MapWindowState();
}

class _MapWindowState extends State<MapWindow> {

  List<Offset> points;
  Offset agent;
  String vehicle;

	@override
	void initState(){
		super.initState();
		points = [Offset(0, 0), Offset(3,0), Offset(3, 11), Offset(0, 11)];
    agent = Offset(3,11);
    vehicle = "walk";
		// Additional initialization of the State
	}
	
	@override
	void didChangeDependencies(){
		super.didChangeDependencies();
		// Additional code
	}
	
	@override
	void dispose(){
		// Additional disposal code
		
		super.dispose();
	}
	
  Widget checkPath(double width, height) {
    if (points == null||points.isEmpty) {
      return Container();
    } else
      return CustomPaint(
            painter: MyPainter(points, width, height),
            child: Container());
  }

	@override 
  Widget build(BuildContext context){
    MyApp parent = context.ancestorWidgetOfExactType(MyApp);
    final MyAppState parentState = parent?.myAppState;
    print(parentState.agentPos);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print("here");
    return Stack(
      children: <Widget>[
          prefix0.Map(),
        
        SizedBox(
          width: width,
          height: height,

          child : checkPath(width, height),
          ),
        AgentDisplay(vehicle, parentState.agentPos, width, height),
      
      ],
    );
    
  }
}

