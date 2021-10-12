import 'package:flutter/material.dart';

class MyThirdPage extends StatelessWidget {
    final String title;
    MyThirdPage({this.title=''}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ecran n° 3",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.blue
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Text("Appuyer sur ce bouton pour revenir à l'écran précédent "),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            RaisedButton(
                child: Text('Ecran n° 1'),
                color: Colors.teal,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.pushNamed(context,'/route1');
                }
            ),
            RaisedButton(
                child: Text('Ecran n° 2'),
                color: Colors.teal,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.pushNamed(context,'/route2');
                }
            ),
          ],
        ),
      ),
      backgroundColor: Colors.red[100],
    );
  }
}
