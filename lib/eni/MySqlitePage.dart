import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'personne2.dart';
 class MySqlitePage extends StatefulWidget {
  String title;
  MySqlitePage({Key? key, this.title='Flutter Demo SQLITE'}) : super(key: key);
  @override
  _MySqlitePageState createState() => _MySqlitePageState();
}
class _MySqlitePageState extends State<MySqlitePage> {

  Map<String,dynamic> mapPersonne={
    'nom' :'DOE',
    'prenom':'John',
    'age':'35'
  } ;

  late Map<String,dynamic> maPersonneRecuperee;
  Personne personneEnregistree =Personne();
  Personne personneRecuperee=Personne();
  PersonneProvider? provider;

  @override
  void initState(){
    super.initState();
    personneEnregistree=Personne.fromMap(mapPersonne);
     getInstance();

     provider!.close();
  }
  Future<PersonneProvider?> getInstance() async {
           provider =await PersonneProvider.instance;
  }


  Future<void> enregistrer() async{
    int id=await provider!.insert(personneEnregistree);
    mapPersonne={'id':id};
    personneRecuperee=Personne.fromMap(maPersonneRecuperee);

    showDialog(
      context: context,
      builder:(BuildContext context){
        return AlertDialog(
          title: Text('Enregistrement'),
          content: Text('Les données ont été enregistrées !'),
        );
      }
    );
  }

  Future<void> recuperer() async{
    if(personneRecuperee.toMap()['id'] !=null){
      personneRecuperee=(await provider!.getPersonne(personneRecuperee.toMap()['id']))!;
      setState(() {
      });
    }else{
      showDialog(
          context: context,
          builder:(BuildContext context){
            return AlertDialog(
              title: Text('Récupération'),
              content: Text('Aucune donnée à récupérer !'),
            );
          }
      );
    }
  }

  Future<void> supprimer() async{
   await provider!.delete(personneRecuperee.toMap()['id']);
    setState(() {
      personneRecuperee =Personne();
    });

    showDialog(
        context: context,
        builder:(BuildContext context){
          return AlertDialog(
            title: Text('Suppression'),
            content: Text('Les données ont été supprimées  !'),
          );
        }
    );

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
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text( 'Nom : ',
                        style:TextStyle(color:Colors.white),
                      ),
                      Text('${personneEnregistree.toMap()['nom']}',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text( 'Prénom : ',
                        style:TextStyle(color:Colors.white),
                      ),
                      Text('${personneEnregistree.toMap()['prenom']}',
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text( 'Age : ',
                        style:TextStyle(color:Colors.white),
                      ),
                      Text('${personneEnregistree.toMap()['age']}',
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text('Données récupérées : '),
            Container(
              height: MediaQuery.of(context).size.height*0.25,
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'id : ',
                        style:TextStyle(
                          fontSize: 25.0,
                            color:Colors.white,
                          fontWeight: FontWeight.bold
                        ),

                      ),
                      personneRecuperee.toMap()['id'] !=null
                      ?Text('${personneRecuperee.toMap()['id']}')
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
                        'Nom : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      personneRecuperee.toMap()['nom'] !=null
                      ?Text('${personneRecuperee.toMap()['nom']}',
                         style: TextStyle(
                            fontSize: 25.0,
                           color: Colors.white,
                           fontWeight: FontWeight.bold
                         ),)
                          :Text('Aucune donnée',
                           style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Prénom : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      personneRecuperee.toMap()['prenom'] !=null?
                          Text('${personneRecuperee.toMap()['prenom']}',
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),)
                          : Text(
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
                      personneRecuperee.toMap()['age'] !=null?
                      Text('${personneRecuperee.toMap()['age']}',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),)
                          : Text(
                        'Aucune donnée',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed:enregistrer,
                  color: Colors.green ,
                  textColor: Colors.white,
                  child: Text('Enregister'),
                ),
                FlatButton(
                  onPressed:recuperer,
                  color: Colors.blue ,
                  textColor: Colors.white,
                  child: Text('Lire les données'),
                ),
                FlatButton(
                  onPressed:supprimer,
                  color: Colors.red ,
                  textColor: Colors.white,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],

        ),
       ),
     );
  }
}


