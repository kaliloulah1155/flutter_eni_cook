import 'package:flutter/material.dart';
import 'package:location/location.dart';

class MyApiGpsPage extends StatefulWidget {
  String title;
  MyApiGpsPage({Key? key, this.title=''}) : super(key: key);
  @override
  _MyApiGpsPageState createState() => _MyApiGpsPageState();
}

class _MyApiGpsPageState extends State<MyApiGpsPage> {

  Location _location=Location();
   LocationData ? _locationData ;

  @override
  void initState(){
    super.initState();
     _trouverPosition();
  }

  Future<void> _trouverPosition() async{
    try{
      if(_location !=null){
        _locationData=await _location.getLocation();

      }else{
       }

    }catch (e){
      print('Erreur lors de la recuperation de la position : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           title: Text(widget.title),
           backgroundColor: Colors.green,
        ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Text('Position actuelle : '),
               Text(
                 _locationData ==null
                     ? 'En attente de longitude'
                     :'Longitude : ${_locationData!.longitude}',
                 style: Theme.of(context).textTheme.bodyText1,
               ),
            Text(
              _locationData ==null
                  ? 'En attente de latitude'
                  :'Latitude : ${_locationData!.latitude}',
              style: Theme.of(context).textTheme.bodyText1,
            )
          ],
        ),
       ),
     );
  }
}

