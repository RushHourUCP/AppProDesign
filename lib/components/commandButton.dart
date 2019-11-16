import 'package:flutter/material.dart';

class CommandButton extends StatefulWidget {
  final CommandButtonState _commandButtonState = CommandButtonState();

  void setOnButtonTaped(VoidCallback callback) {
    _commandButtonState.callback = callback;
  }

  @override
  State<StatefulWidget> createState() {
    return _commandButtonState;
  }

  void setEnabled(bool boolean) {
    _commandButtonState.setEnabled(boolean);
  }
}

class CommandButtonState extends State<CommandButton> {
  VoidCallback callback;
  bool _isEnabled = false;

  void setEnabled(bool boolean) {
    setState(() {
      _isEnabled = boolean;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 80.0,
      child: Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: InkWell(
                  onTap: () async {
                    //Function Callback is located in commandWindow.dart
                    if (_isEnabled) callback();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      gradient: LinearGradient(
                        colors: [
                          Color(_isEnabled ? 0xFF48c6ef : 0xaaaaaa),
                          Color(_isEnabled ? 0xFF6f86d6 : 0xaaaaaa)
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.only(
                        left: 55.0, right: 55.0, top: 20.0, bottom: 20.0),
                    child: const Text('REQUEST MISSION',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                  )),
            ),
          )),
    );
  }
}
