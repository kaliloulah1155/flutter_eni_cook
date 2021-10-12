import 'package:flutter/material.dart';
import 'package:exple_api/eni/personne1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySpPage extends StatefulWidget {
  String title;
  MySpPage({Key? key, this.title='Flutter Demo Shared preferences'}) : super(key: key);
  @override
  _MySpPageState createState() => _MySpPageState();
}

Widget _userDetail (String texte,String val){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$texte : ',
        style: TextStyle(color: Colors.white),
      ),
      Text('${val}',
        style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),
      ),
    ],
  );
}

class _MySpPageState extends State<MySpPage> {

   final Personne personneEnregistree=Personne("DOE","John","35");
   Personne ? personneRecuperee;
   Future<SharedPreferences> _prefs=SharedPreferences.getInstance();

   Future<void> enregister() async{
     final SharedPreferences prefs=await _prefs;
     prefs.setStringList("personne", [
       '${personneEnregistree.nom}',
       '${personneEnregistree.prenom}',
       '${personneEnregistree.age}',
     ]);
     showDialog(
         context: context,
         builder: (BuildContext context){
           return AlertDialog(
             title: Text('Enregistrement'),
             content: Text('Les données ont été enregistrées'),
           );
         }
     );
   }
   Future<void> recuperer() async{
     final SharedPreferences prefs = await _prefs;

     if(prefs.getStringList("personne") !=null){
       var liste =prefs.getStringList("personne");
       setState(() {
           personneRecuperee = Personne(liste![0],liste[1],liste[2]);

        });
     }
   }
   Future<void> supprimer() async{
     final SharedPreferences prefs =await _prefs;
     prefs.remove("personne");
     setState(() {
         personneRecuperee =Personne('Aucune donnée','Aucune donnée','Aucune donnée');
     });
     showDialog(
       context: context,
       builder: (BuildContext context){
         return AlertDialog(
             title: Text('Suppression'),
             content:Text('Les données ont été supprimées ! ')
         );
       }
     );
}

   @override
   void initState(){
     super.initState();
     recuperer();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           title: Text(widget.title),
           backgroundColor: Colors.green,
        ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              Icon(
                Icons.account_circle,
                size: 80.0,
                color: Colors.blue,
              ),
             Text('Données soumises : '),
             Container(
               height: MediaQuery.of(context).size.height*0.25,
               width: MediaQuery.of(context).size.width*0.80,
               decoration: BoxDecoration(
                 color: Colors.grey,
                 shape:BoxShape.rectangle,
                 borderRadius: BorderRadius.circular(20.0),
               ),
               child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   _userDetail('Nom',personneEnregistree.nom),
                   _userDetail('Prénom',personneEnregistree.prenom),
                   _userDetail('Age',personneEnregistree.age),

                 ],
               ) ,
             ),
            Text('Données récupérées : '),
            Container(
              height: MediaQuery.of(context).size.height*0.25,
              width: MediaQuery.of(context).size.width*0.80,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape:BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nom : ',
                            style: TextStyle(color: Colors.white),
                          ),
                          personneRecuperee !=null ?
                          Text('${personneRecuperee!.nom}',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          )
                              :Text(
                            'Aucune donnée',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Prénom : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      personneRecuperee !=null ?
                      Text('${personneRecuperee!.prenom}',
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      )
                          :Text(
                        'Aucune donnée',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      personneRecuperee !=null ?
                      Text('${personneRecuperee!.age}',
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      )
                          :Text(
                        'Aucune donnée',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ) ,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                   onPressed:enregister,
                    color: Colors.green ,
                     textColor: Colors.white,
                    child: Text('Enregister'),
                ),
                FlatButton(
                  onPressed: recuperer,
                  color: Colors.blue ,
                  textColor: Colors.white,
                  child: Text('Lire les données'),
                ),
                FlatButton(
                  onPressed: supprimer,
                  color: Colors.red ,
                  textColor: Colors.white,
                  child: Icon(
                     Icons.delete,
                     color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
       ),
     );
  }
}


