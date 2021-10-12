import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MyJsonPage extends StatefulWidget {
  String title;
  MyJsonPage({Key? key, this.title='Flutter Demo JSON API' }) : super(key: key);
  @override
  _MyJsonPageState createState() => _MyJsonPageState();
}


class _MyJsonPageState extends State<MyJsonPage> {

  final String url ='https://www.omdbapi.com/?i=tt3896198&apikey=f5e749e8';
  late Map<String,dynamic> film;
  bool dataOK=false;

  @override
  void initState(){
     recupFilm();
    super.initState();
  }
  Future<void> recupFilm() async{
    var response = await http.post(Uri.parse(url));
     ///debugPrint('$film');
    if(response.statusCode ==200){
      film=convert.jsonDecode(response.body);
      debugPrint('$film');
       setState(() {
        dataOK=!dataOK;
      });
    }
  }

  Widget attente(){

    return Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text('En attente de données',
             style: TextStyle(
               color: Colors.white,
               fontSize: 20.0,
               fontWeight: FontWeight.bold
             ),
           ),
           CircularProgressIndicator(),

         ],
       ),
    );
  }

  Widget affichage(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          film !=null ?
              Text(
                '${film['Title']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              )
              : Text('Aucune donnée'),
          film !=null ?
          Text(
            '${film['Year']}',
            style: TextStyle(
                color: Colors.black,
            ),
          )
              : Text('Aucune donnée') ,
          Padding(padding: EdgeInsets.all(20.0),),
          Container(
            width: MediaQuery.of(context).size.width*0.6,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0,7.0),
                spreadRadius: 3.0,
                blurRadius: 15.0
              ),
            ]),
            child: film !=null ? Image.network('${film['Poster']}') : Text('Aucune donnée'),
          ),
          Padding(padding: EdgeInsets.all(20.0),),
          film !=null ?
              Text('${film['Plot']}',
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ): Text('Aucune donnée'),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           title: Text(widget.title),
           backgroundColor: Colors.green,
        ),
      body: dataOK ? affichage() : attente(),
      backgroundColor: Colors.yellow[100],
     );
  }
}


