import 'package:flutter/material.dart';
import 'Voiture.dart';

class MyGridViewPage extends StatefulWidget {
  String title;
  MyGridViewPage({Key? key, this.title=''}) : super(key: key);
  @override
  _MyGridViewPageState createState() => _MyGridViewPageState();
}

class _MyGridViewPageState extends State<MyGridViewPage> {

  List<Voiture> _voitures=[
    Voiture("Renault", 'Twingo', new Image.asset("assets/images/car1.jpg")),
    Voiture("Citroen", 'C5', Image.asset("assets/images/car2.jpg")),
    Voiture("Ford", 'Focus', Image.asset("assets/images/car3.jpg")),
    Voiture("Porsche", 'Carrera', Image.asset("assets/images/car4.jpg")),
    Voiture("Ferrari", 'F340', Image.asset("assets/images/car5.jpg")),

    Voiture("Renault", 'Twingo', Image.asset("assets/images/car1.jpg")),
    Voiture("Citroen", 'C5', Image.asset("assets/images/car2.jpg")),
    Voiture("Ford", 'Focus', Image.asset("assets/images/car3.jpg")),
    Voiture("Porsche", 'Carrera', Image.asset("assets/images/car4.jpg")),
    Voiture("Ferrari", 'F340', Image.asset("assets/images/car5.jpg")),

    Voiture("Renault", 'Twingo', Image.asset("assets/images/car1.jpg")),
    Voiture("Citroen", 'C5', Image.asset("assets/images/car2.jpg")),
    Voiture("Ford", 'Focus', Image.asset("assets/images/car3.jpg")),
    Voiture("Porsche", 'Carrera', Image.asset("assets/images/car4.jpg")),
    Voiture("Ferrari", 'F340', Image.asset("assets/images/car5.jpg")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           title: Text(widget.title),
           backgroundColor: Colors.cyan,
        ),
      body:  GridView.builder(
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
               itemCount: _voitures.length,
              itemBuilder: (context,index){
                final item=_voitures[index];
                return Card(
                  color: Colors.cyan,
                  elevation: 3.0,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        item.image,
                        Divider(color: Colors.white,),
                        Text('${item.modele}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                        Text('${item.marque}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              }

      ),
    );
  }
}

