import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PVTest extends StatefulWidget{
  const PVTest({Key? key}):super(key:key);

  @override
  _PVTestState createState() => _PVTestState();
}

class _PVTestState extends State<PVTest>{

  static const platform = MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _getBatteryLevel,
                child: const Text('Get Battery Level'),
              ),
              Text(_batteryLevel),
            ],
          ),
        ),
      )

    );
  }
}