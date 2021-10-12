 import 'package:flutter/material.dart';
import 'e_commerce_screen_after.dart';

 void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green,
       ),
      home: ECommerceScreen()

    );
  }
}
