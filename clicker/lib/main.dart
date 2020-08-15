import 'dart:async';

import 'package:flutter/material.dart';
import 'util/UniqueColorGenerator.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clicker',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Clicker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _clickCounter = 0;
  String _inactivityMessage = "";
  Color _color = Colors.white;
  Timer _timer;

  void _onScreenTap() {
    setState(() {
      _clickCounter++;
      _inactivityMessage = "";
      _color = UniqueColorGenerator.getColor();
    });
    _initializeTimer();
  }

  void _initializeTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer(const Duration(seconds: 15), () => _handleInactivity());
  }

  void _handleInactivity() {
    _timer?.cancel();
    _timer = null;
    setState(() {
      _inactivityMessage = "Click me or close an app.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _onScreenTap,
          child: Container(
            alignment: Alignment.center,
            color: _color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hey there',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'You have tapped the screen: $_clickCounter',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '$_inactivityMessage',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
