import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'star.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Image.asset('assets/beach.jpg'),
          Transform.translate(
              offset: Offset(0,100),
           ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
               _buildProfileImage(context),
               _buildProfileDetails(context),
               _buildActions(context),
             ],
          ),
        ],
      ),
      backgroundColor: Colors.yellow[100],
    );
  }
}

Widget _buildProfileImage(BuildContext context){
  return Container(
    width: 200,
    height: 200,
     child: ClipOval(
      child: Image.asset(
        'assets/dog.jpg',
        fit: BoxFit.fitWidth,
      ),
    ),
  );
}
Widget _buildProfileDetails(BuildContext context){
  return Padding(
    padding: EdgeInsets.all(20.0),
    child: Column(
         children: [
          Text(
              'Wofram Barkovich',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600
            ),
          ),
          StarRating(value: 5),
          _buildDetailsRow('Age','4'),
          _buildDetailsRow('Status','Good Boy'),
        ],

    ),
  );
}

Widget _buildActions(BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
        _buildIcon(Icons.restaurant,'Feed'),
      _buildIcon(Icons.favorite,'Pet'),
      _buildIcon(Icons.directions_walk,'Walk')
    ],
  );
}
Widget _buildDetailsRow(String heading,String value){
     return Row(
       children: [
         Text(
           '$heading : ',
           style: TextStyle(fontWeight: FontWeight.bold),
         ),
         Text(value),
       ],
     );
}

Widget _buildIcon(IconData icon,String text){
  return Padding(
    padding: EdgeInsets.all(20.0),
    child: Column(
      children: [

        Icon(icon,size: 40,),
         Text(text),
      ],
    ),
  );
}


















