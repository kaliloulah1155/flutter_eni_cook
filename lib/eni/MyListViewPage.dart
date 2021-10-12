import 'package:flutter/material.dart';
import 'Voiture.dart';

class MyListViewPage extends StatefulWidget {
  String title;
  MyListViewPage({Key? key, this.title=''}) : super(key: key);
  @override
  _MyListViewPageState createState() => _MyListViewPageState();
}

class _MyListViewPageState extends State<MyListViewPage> {

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
      body:ListView.separated(
           separatorBuilder: (context,index)=>Divider(color:Colors.cyan ,),
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
                 child: ListTile(
                   title: Text(
                     '${item.modele}',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.cyan,
                       fontSize: 20
                     ),
                   ),
                   subtitle: Text(
                     '${item.marque}',
                     textAlign: TextAlign.center,
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
             );
          }
      ),
    );
  }
}

