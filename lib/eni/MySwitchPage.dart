import 'package:flutter/material.dart';
import 'MySecondPage.dart';

class MySwitchPage extends StatefulWidget {
  String title;
  MySwitchPage({Key? key, this.title=''}) : super(key: key);

  @override
  _MySwitchPageState createState() => _MySwitchPageState();
}

class _MySwitchPageState extends State<MySwitchPage> {
  bool _choixSwitch=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           title: Text(widget.title),
        ),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choix de l\'utilisateur',
              style: TextStyle(
                 color: Colors.blueGrey,
                fontSize: 38
              ),
            ),
            Divider(),
            Text(
              'Switch',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Switch(
                   value: _choixSwitch,
                   activeColor: Colors.green,
                   activeTrackColor: Colors.amber,
                   inactiveTrackColor: Colors.red[200],
                   inactiveThumbColor: Colors.red,
                   onChanged: (value){
                     setState(() {
                        _choixSwitch=value;

                     });
                   },

                 ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Text(_choixSwitch ? 'Pour' : 'Contre'),

          ],
        ),
      ),
    );
  }
}

