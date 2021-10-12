import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;
   MyHomePage({Key? key,this.title=''}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _tf='Aucun texte saisi';
  String _tfs='Aucun texte soumis';

  TextStyle _textStyleDefault=TextStyle(
    color: Colors.white
  );
  TextStyle _textStyleSaisie=TextStyle(
      color: Colors.amber,
     fontWeight: FontWeight.bold
  );

  final _controller =TextEditingController();
  void initState(){
    super.initState();
    _controller.addListener(_afficherLaValeurDuChamp);
    _controller.value=TextEditingValue(text: '$_tf');
  }
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  _afficherLaValeurDuChamp(){
    setState(() {
      _tf=_controller.text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(
                 'Formulaire',
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 40,
                   color: Colors.blue
                 ),
               ),
               Divider(thickness: 2,),
               Padding(padding: EdgeInsets.only(bottom: 20)),
               Container(
                 height: MediaQuery.of(context).size.height*0.7,
                 width: MediaQuery.of(context).size.width*0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text('1-Saisie d\'un texte dans une TextField : '),
                       TextField(
                         controller: _controller,
                         decoration: InputDecoration(
                            border: OutlineInputBorder()
                         ),

                       ),
                      Padding(padding: EdgeInsets.only(bottom: 40)),
                      Container(
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                              '1- Texte en cours de saisie dans TextField : ',
                               style: _textStyleDefault,
                            ),
                            Text(
                              '$_tf',
                              style: _textStyleSaisie,
                            ),
                            Text(
                              '1-Text soumis dans TextField : ',
                              style: _textStyleDefault,
                            ),
                            Text(
                              '$_tfs',
                              style: _textStyleSaisie,
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 10))
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          boxShadow: [BoxShadow(
                            color: Colors.black,
                            blurRadius: 25.0,
                            spreadRadius: 5.0,
                            offset: Offset(0,15)
                          )]
                        ),
                      ),
                    ],
                  ),
               ),

             ],
          ),
        ),
      ),
    );
  }
}

