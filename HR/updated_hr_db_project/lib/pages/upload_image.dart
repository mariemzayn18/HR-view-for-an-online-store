import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  PickedFile imageFile;
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return profileImage();
  }

  Widget bottomsheet()
  {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20
          ,vertical: 20),
      child: Column(
        children: <Widget>[
          Text('Choose Profile Picture',
            style: TextStyle(
                fontSize: 20
            ),
          ),
          SizedBox( height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon( Icons.camera),
                onPressed: (){
                  takephoto(ImageSource.camera);

                },
                label: Text('Camera'),
              ),
              FlatButton.icon(
                icon: Icon( Icons.image),
                onPressed: (){
                  takephoto(ImageSource.gallery);

                },
                label: Text('Gallery'),
              )

            ],

          )
        ],
      ),
    );

  }
  void takephoto ( ImageSource source) async {
    final PickedFile = await picker.getImage(
      source: source,
    );
  }
  Widget profileImage(){
    return Center(
      child: Stack (
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundImage: imageFile == null
                ? AssetImage("assets/sm.png")
                : FileImage(File(imageFile.path)),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: (){
                showModalBottomSheet<void>(
                  context: context,
                  builder:((builder)=> bottomsheet()),
                );
              },
              child: Icon(
                  Icons.camera_alt,
                  color: Colors.grey[700],
                  size:28
              ),
            ),
          )

        ],

      ),
    );
  }
}