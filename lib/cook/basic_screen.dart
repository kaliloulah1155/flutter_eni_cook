import 'text_layout.dart';
import 'package:flutter/material.dart';
import 'immutable_widget.dart';
class BasicScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Welcome to flutter'),
        actions: [
          Padding(
              padding: EdgeInsets.all(10.0),
            child: Icon(Icons.edit),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: ImmutableWidget(),
          ),
          TextLayout()
        ],

      ),
      drawer: Drawer(
        child: Container(
          color: Colors.lightBlue,
          child: Center(
            child: Text("I'm a Drawer"),
          ),
        ),
      ) ,
    );
  }
}
