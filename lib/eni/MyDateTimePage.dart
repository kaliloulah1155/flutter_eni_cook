import 'package:flutter/material.dart';



class MyDateTimePage extends StatefulWidget {
  String title;
  MyDateTimePage({Key? key, this.title=''}) : super(key: key);
  @override
  _MyDateTimePageState createState() => _MyDateTimePageState();
}

class _MyDateTimePageState extends State<MyDateTimePage> {
    var _date=null;
    var _heure=null;

  Future<Null> _selectionDate() async{
       DateTime? _dateChoisie=await showDatePicker(
           context: context,
           initialDate: DateTime.now(),
           firstDate: DateTime(1900),
           lastDate: DateTime(2030)
       );
       if(_dateChoisie !=null){
         setState(() {
              _date=_dateChoisie;
         });
       }
  }
  Future<Null> _selectionHeure() async{
    TimeOfDay? _heureChoisie= await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    );
    if(_heureChoisie !=null){
      setState(() {
          _heure=_heureChoisie;
      });
    }

  }

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
            RaisedButton(
              child: Text("Ouvrir un DatePicker"),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 8,
              onPressed: (){
                _selectionDate();
              } 
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Text(
              'Voici la date choisie : ',
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Text(
              _date==null
                  ? 'Aucune date choisie'
                  :'${_date.day}/${_date.month.toString().length==1 ? '0'+_date.month.toString() :_date.month}/${_date.year}',
              style: _date ==null
                   ? TextStyle(color: Colors.blue)
                   :TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 40
                    )
              ,
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            RaisedButton(
               child: Text('Ouvrir un TimePicker'),
                color: Colors.green,
                textColor: Colors.white,
                elevation: 8,
                onPressed: (){
                  _selectionHeure();
                }
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Text("Voici l'heure choisie : "),
            Text(
              _heure==null
                  ? 'Aucune heure choisie'
                  : '${_heure.format(context)}',
              style: _heure==null
                   ? TextStyle(color: Colors.green)
                    : TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 40
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.yellow[100],
    );
  }
}
