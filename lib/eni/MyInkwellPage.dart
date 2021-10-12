import 'package:flutter/material.dart';
import 'Voiture.dart';

class MyInkwellPage extends StatefulWidget {
  String title;
  MyInkwellPage({Key? key, this.title=''}) : super(key: key);
  @override
  _MyInkwellPageState createState() => _MyInkwellPageState();
}

class _MyInkwellPageState extends State<MyInkwellPage> {

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
      body:ListView.builder(
          itemCount: _voitures.length,
          itemBuilder: (context,index){
             final item=_voitures[index];
             return Dismissible(
                 key: Key(item.modele),
                 background: Container(
                   child: Icon(
                     Icons.delete,
                     size: 40,
                     color: Colors.white,
                   ),
                   color: Colors.cyan,
                 ),
                 onDismissed: (direction){
                   setState(() {
                     _voitures.removeAt(index);
                   });
                   Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Voiture ${item.modele} supprimée'))
                   );
                 },
                 child: Container(
                    height: 50,
                   decoration: BoxDecoration(
                     boxShadow: [
                         BoxShadow(
                           color: Colors.grey,
                           blurRadius: 10,
                           offset: Offset(-15.0,0.0)
                         )
                     ],
                     gradient: LinearGradient(
                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                       colors: [
                         Color(0xffe5db7e),
                         Color(0xffefefef)
                       ],
                     ),
                   ),
                   child: InkWell(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              '${item.modele}',
                            style: TextStyle(
                              color: Colors.cyan[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                            ),
                          ),
                          Text(
                            '${item.marque}',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                     ),
                     onTap: (){
                       showDialog(
                           context: context,
                           builder: (BuildContext context){
                             return AlertDialog(
                               backgroundColor: Colors.cyan,
                               title: Text(
                                 'Photo de la voiture ${item.modele}',
                                 style: TextStyle(color: Colors.white),
                               ),
                               content: item.image,
                             );
                           }
                       );
                     },
                   ),
                 ),
             );
          }
      ),
    );
  }
}

