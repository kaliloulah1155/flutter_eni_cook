import 'package:flutter/material.dart';

class MySliderPage extends StatefulWidget {
  String title;
  MySliderPage({Key? key, this.title=''}) : super(key: key);

  @override
  _MySliderPageState createState() => _MySliderPageState();
}
enum RadioChoix {Voiture,Avion,Bateau}
class _MySliderPageState extends State<MySliderPage> {
 double _choixSlider=5.0;
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
            Text('Slider',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            Slider(
              value: _choixSlider,
              label: '$_choixSlider',
              activeColor: Colors.green,
              inactiveColor: Colors.green[100],
              min: 0.0,
              max: 10.0,
              divisions: 10,
              onChanged: (value){
                setState(() {
                  print(value);
                    _choixSlider=value;
                });
              },
            ),
            Text(
              'Valeur du slider : $_choixSlider',
              style: TextStyle(
                color: _choixSlider<5 ? Colors.red : Colors.green
              ),
            )
          ],
        ),
      ),
    );
  }
}

