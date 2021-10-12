import 'package:flutter/material.dart';
import 'MySecondPage.dart';

class MyFirstPage extends StatelessWidget {
  String title;
  MyFirstPage({Key? key, this.title=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ecran n° 1",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.teal
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Text("Appuyez sur ce bouton pour passer à l'ecran suivant "),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            RaisedButton(
                child: Text('Ecran n° 2'),
                color: Colors.teal,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.pushNamed(context,'/route2');
                }
            ),
            RaisedButton(
                child: Text('Ecran n° 3'),
                color: Colors.teal,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.pushNamed(context,'/route3');
                }
            ),
          ],
        ),
      ),
      backgroundColor: Colors.green[100],
    );
  }
}