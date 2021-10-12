import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class MyApiCameraPage extends StatefulWidget {
  String title;
  MyApiCameraPage({Key? key, this.title=''}) : super(key: key);
  @override
  _MyApiCameraPageState createState() => _MyApiCameraPageState();
}

class _MyApiCameraPageState extends State<MyApiCameraPage> {

  late File _imageFile;
  dynamic _pickImageError;
  final picker=ImagePicker();

  bool _load = true;

  Widget _visualiserImage(){
    if(_imageFile !=null){
      return Image.file(_imageFile);
    }else if(_pickImageError !=null){
      return Text(
        'Erreur de récupération d\'image : $_pickImageError',
        textAlign: TextAlign.center,
      );
    }else{
      return const Text(
        'Aucune image',
        textAlign: TextAlign.center,
      );
    }
  }

  Future<void> _onImageButtonPressed(ImageSource source) async{
    try {
          final pickedFile =await picker.getImage(source: source);
          setState((){
               _imageFile=File(pickedFile!.path);
               print(_imageFile);
               _load = false;
          });
       }catch(e){
        _pickImageError=e;
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
         child:  _load == true ?  Text('Image non visible') :_visualiserImage() ,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: (){
                 _onImageButtonPressed(ImageSource.gallery);
              },
              child: const Icon(Icons.photo_library),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              backgroundColor: Colors.green[800],
              onPressed: (){
                _onImageButtonPressed(ImageSource.camera);
              },
              child: const Icon(Icons.photo_camera),
            ),
          ),
        ],
      ),
    );
  }
}

