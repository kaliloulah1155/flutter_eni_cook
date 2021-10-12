import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool loggedIn=false;
  String name='vide';

  //for form
  final _nameController=TextEditingController();
  final _emailController=TextEditingController();
  final _formKey=GlobalKey<FormState>();

  Widget _buildSuccess(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check,color: Colors.orangeAccent,size: 60,),
        Text('Hi $name',style: TextStyle(fontSize: 40),)
      ],
    );
  }



  Widget _buildLoginForm(){
    return Form(
        key: _formKey,
         child: Padding(
           padding: EdgeInsets.all(20.0),
           child: Column(
             children: [
               TextFormField(
                 controller: _nameController,
                 decoration: InputDecoration(
                   labelText: 'Runner',
                 ),
                validator: (text){
                   if(text ==null || text.isEmpty){
                     return 'Enter the runner \'s name .';
                   }
                   return null;
                },
               ),
               TextFormField(
                 controller: _emailController,
                 keyboardType: TextInputType.emailAddress,
                 decoration: InputDecoration(
                   labelText: 'Email',
                 ),
                 validator: (text){
                   if(text ==null || text.isEmpty){
                     return 'Enter the runner \'s email .';
                   }
                   final regex=RegExp('[^@]+@[^\.]+\..+');
                   if(!regex.hasMatch(text)){
                     return 'Enter a valid email';
                   }
                   return null;
                 },
               ),
               SizedBox(height: 20,),
               ElevatedButton(
                   onPressed: _validate,
                   child: Text('Continue')
               ),
             ],
           ),
         ),
    );
  }
  void _validate(){
    final form =_formKey.currentState;
    if(!form!.validate()){
      return;
    }
    setState(() {
      loggedIn =true;
      name=_nameController.text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
         child: loggedIn ? _buildSuccess() : _buildLoginForm(),

      ),
    );
  }
}
