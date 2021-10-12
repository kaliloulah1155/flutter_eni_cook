import 'package:flutter/material.dart';

class MyRadioPage extends StatefulWidget {
  String title;
  MyRadioPage({Key? key, this.title=''}) : super(key: key);

  @override
  _MyRadioPageState createState() => _MyRadioPageState();
}
enum RadioChoix {Voiture,Avion,Bateau}
class _MyRadioPageState extends State<MyRadioPage> {
  bool _choixSwitch=false;
  RadioChoix? _choixRadio=RadioChoix.Voiture;
  Icon _iconRadio=Icon(Icons.airplanemode_active);


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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              Text(
                'Choix de l\'utilisateur',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 38
                ),
              ),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Radio<RadioChoix>(
                  value: RadioChoix.Voiture,
                  groupValue: _choixRadio,
                  onChanged: (RadioChoix? value) {
                    setState(() {
                      _choixRadio = value;
                      _iconRadio=Icon(Icons.directions_car);
                    });
                  },
                ),
                Text('Voiture',style: _choixRadio==RadioChoix.Voiture?
                TextStyle(color: Colors.green,fontWeight: FontWeight.bold):TextStyle(),),
                Radio<RadioChoix>(
                  value: RadioChoix.Avion,
                  groupValue: _choixRadio,
                  onChanged: (RadioChoix? value) {
                    setState(() {
                      _choixRadio = value;
                      _iconRadio=Icon(Icons.airplanemode_active);
                    });
                  },
                ),
                Text('Avion',style: _choixRadio==RadioChoix.Avion?
                TextStyle(color: Colors.green,fontWeight: FontWeight.bold):TextStyle(),),
                Radio<RadioChoix>(
                  value: RadioChoix.Bateau,
                  groupValue: _choixRadio,
                  onChanged: (RadioChoix? value) {
                    setState(() {
                      _choixRadio = value;
                      _iconRadio=Icon(Icons.directions_boat);
                    });
                  },
                ),
                Text('Bateau',style: _choixRadio==RadioChoix.Bateau?
                TextStyle(color: Colors.green,fontWeight: FontWeight.bold):TextStyle(),),
              ],
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 _iconRadio
            ],)
          ],
        ),
      ),
    );
  }
}

