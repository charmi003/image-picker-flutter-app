import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _image;
  var imagePicker;
  var type;

  @override
  void initState(){
    super.initState();
    imagePicker=ImagePicker();
  }

  Future openCamera() async{
    var image=await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image=File(image!.path);
      type='camera';
    });
  }

  Future openGallery() async{
    var image=await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image=File(image!.path);
      type='gallery';
    });
  }

  Future _optionsDialogBox() async{
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Colors.teal,
        contentPadding: EdgeInsets.fromLTRB(20.0,50.0,20.0,50.0),
        shape: RoundedRectangleBorder(),
        // title:const Text('Choose from the below options'),
        content:SingleChildScrollView(
          child: ListBody(
            children: [
              GestureDetector(
                child:Text('Take a picture',style:TextStyle(color:Colors.white,fontSize: 20)),
                onTap: openCamera,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0,15,0,15)),
              GestureDetector(
                child:Text('Select image from gallery',style:TextStyle(color:Colors.white,fontSize: 20)),
                onTap: openGallery,
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type=='camera' ? 'Image From Camera' : (type=='gallery' ? 'Image from Gallery' : 'My Image Picker App')),
      ),
      body: Center(
        child:Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            color:Colors.red[200]
          ),
          child: _image==null ?
          Container(
            width:200.0,
            height: 200.0,
            decoration:BoxDecoration(
              color:Colors.red[200]
            ),
            child: Icon(
              Icons.camera_alt,
              color:Colors.grey[800]
            )
          )
          :  Image.file(
            _image,
            height:200.0,
            width:200.0,
            fit:BoxFit.fitHeight
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> _optionsDialogBox(),
        child: Icon(Icons.add_a_photo),
        tooltip: 'Choose an image',
      ),
      
    );
  }
}