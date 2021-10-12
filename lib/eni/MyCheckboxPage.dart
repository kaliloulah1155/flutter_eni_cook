import 'package:flutter/material.dart';

class MyCheckboxPage extends StatefulWidget {
  String title;
  MyCheckboxPage({Key? key, this.title=''}) : super(key: key);

  @override
  _MyCheckboxPageState createState() => _MyCheckboxPageState();
}
enum RadioChoix {Voiture,Avion,Bateau}
class _MyCheckboxPageState extends State<MyCheckboxPage> {
   Map _mapTransport={
      RadioChoix.Voiture:false,
       RadioChoix.Avion:false,
       RadioChoix.Bateau:false
   };
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
            Text('Checkbox',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  activeColor: Colors.green,
                    value: this._mapTransport[RadioChoix.Voiture],
                    onChanged: (value){
                       setState(() {
                          _mapTransport[RadioChoix.Voiture]=value;
                       });
                    }
                ),
                Text('Voiture',style: _mapTransport[RadioChoix.Voiture] ?
                   TextStyle(color: Colors.green):TextStyle(),),
                Checkbox(
                    activeColor: Colors.green,
                    value: this._mapTransport[RadioChoix.Avion],
                    onChanged: (value){
                      setState(() {
                        _mapTransport[RadioChoix.Avion]=value;
                      });
                    }
                ),
                Text('Avion',style: _mapTransport[RadioChoix.Avion] ?
                TextStyle(color: Colors.green):TextStyle(),),

                Checkbox(
                    activeColor: Colors.green,
                    value: this._mapTransport[RadioChoix.Bateau],
                    onChanged: (value){
                      setState(() {
                        _mapTransport[RadioChoix.Bateau]=value;
                      });
                    }
                ),
                Text('Bateau',style: _mapTransport[RadioChoix.Bateau] ?
                TextStyle(color: Colors.green):TextStyle(),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.directions_car,color: _mapTransport[RadioChoix.Voiture] ?
                  Colors.green:Colors.grey[300],),
                Icon(Icons.airplanemode_active,color: _mapTransport[RadioChoix.Avion] ?
                Colors.green:Colors.grey[300],),
                Icon(Icons.directions_boat,color: _mapTransport[RadioChoix.Bateau] ?
                Colors.green:Colors.grey[300],),
              ],
            )
          ],
        ),
      ),
    );
  }
}

