import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(PlaygroundApp());

class PlaygroundApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plugin Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Playground(title: 'Plugin Playground'),
    );
  }
}

class Playground extends StatefulWidget {
  Playground({Key key, this.title}) : super(key: key);

  final String title;
  @override
  PlaygroundState createState() => PlaygroundState();
}

class PlaygroundState extends State<Playground> {

  String batteryLevel = 'Unknown battery level.';
  String nativeTime = "";

  static const batteryChannel = const MethodChannel("battery");
  static const streamChannel = const EventChannel("streamTime");

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Press button to run Platform Channel"),
              Text("-"),
              Text(nativeTime)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: runStreamTime,
          tooltip: 'Platform Channels',
          child: Icon(Icons.play_arrow),
        )
    );
  }

  /// Method Channel Battery Level

  Future<void> _getBatterLevel() async {
    final int result = await batteryChannel.invokeMethod("getBatteryLevel");

    setState(() {
      batteryLevel = "Battery Level is $result %.";
    });
  }

  /// Event Channel Stream Time

  void runStreamTime() async {

    streamChannel.receiveBroadcastStream().listen((dynamic msg) {

      setState(() {
        nativeTime += msg.toString() + "\n";
      });

    });

  }












/*
  // Get battery level.

  Future<void> getBatteryLevel() async {

    final int result = await batteryChannel.invokeMethod('getBatteryLevel');

    setState(() {
      batteryLevel =  'Battery level at $result %';
    });
  }


  /////////////// Playground ///////////////////////////////////////////////////


  void runStreamTime() async {

    streamChannel.receiveBroadcastStream().listen((dynamic msg) {

      setState(() {
        nativeTime += msg.toString() + "\n";
      });
    },
    );
  }*/



}
