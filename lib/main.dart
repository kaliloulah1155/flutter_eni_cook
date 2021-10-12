import 'package:exple_api/Login_screen.dart';
import 'package:flutter/material.dart';
import 'stopwatch.dart';
 void main() {
  runApp(StopwatchApp());
}
class StopwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      

    );
  }
}
