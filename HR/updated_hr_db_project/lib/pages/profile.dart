import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:updated_hr_db_project/pages/upload_image.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:flutter/services.dart';
import 'package:validators/validators.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  // for eye icon
  bool showPassword=false;
  bool showConfPassword=false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.teal[400],

        elevation: 0,
        title: Text('Edit profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(

        child: Container(
          margin: EdgeInsets.all(20),
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Account(),
              SizedBox(height: 15,),

              ///// -------------- email
              Theme(
                data: new ThemeData(
                  primaryColor: Colors.lightBlueAccent,
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),

                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(15.0),
                      ),),
                    labelText: 'mariemzayn@gmail.com',

                    prefixIcon: const Icon(Icons.email, color: Colors.blueGrey,),
                    enabled: false,
                  ),
                ),
              ),
              SizedBox(height: 15,),


              ///// --------------  FIRST NAME
              Theme(
                    data: new ThemeData(
                      primaryColor: Colors.lightBlueAccent,
                    ),
                child: TextFormField(

                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                        border: new OutlineInputBorder(
                             borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),

                          ),),
                        prefixIcon: const Icon(Icons.person, color: Colors.blueGrey,),
                        labelText: 'First name',

                  fillColor: Colors.grey,
                    ),

                  ),
              ),

              SizedBox(height: 15,),

              ///// --------------  LAST NAME

              Theme(
                data: new ThemeData(
                  primaryColor: Colors.lightBlueAccent,
                ),
                child: TextFormField(
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(15.0),
                      ),),
                    prefixIcon: const Icon(Icons.person, color: Colors.blueGrey,),
                    labelText: 'Last name',
                  ),
                ),
              ),
              SizedBox(height: 15,),

              ///// --------------  ADDRESS

              Theme(
                data: new ThemeData(
                  primaryColor: Colors.lightBlueAccent,
                ),
                child: TextFormField(
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(15.0),
                      ),),
                    prefixIcon: const Icon(Icons.home_outlined, color: Colors.blueGrey,),

                    labelText: 'Address',
                  ),
                ),
              ),
              SizedBox(height: 15,),

              ///// --------------  PHONE NUMBER

              Theme(
                data: new ThemeData(
                  primaryColor: Colors.lightBlueAccent,
                ),
                child: TextFormField(
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(15.0),
                      ),),
                    prefixIcon: const Icon(Icons.phone, color: Colors.blueGrey,),

                    labelText: 'Phone number',),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly],

                ),
              ),
              SizedBox(height: 15,),



              ///// --------------  NEW PASSWORD
              Theme(
                data: new ThemeData(
                  primaryColor: Colors.lightBlueAccent,
                ),
                child: TextFormField(
                  obscureText:showPassword? false:true,
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(15.0),
                      ),),
                    prefixIcon: const Icon(Icons.lock_rounded, color: Colors.blueGrey,),

                    labelText: 'New password',
                    suffixIcon: IconButton(
                      onPressed:(){
                        setState(() {
                          showPassword=!showPassword;
                        });
                      } ,
                      icon: Icon(Icons.remove_red_eye_sharp),
                      color: Colors.grey,

                    ),

                  ),
                ),
              ),
              SizedBox(height: 15,),

              ///// --------------  CONFIRM PASSWORD

              Theme(
                data: new ThemeData(
                  primaryColor: Colors.lightBlueAccent,
                ),
                child: TextFormField(
                  obscureText:showConfPassword? false:true,
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(15.0),
                      ),),
                    prefixIcon: const Icon(Icons.lock_rounded, color: Colors.blueGrey,),
                    labelText: 'Confirm password',
                    suffixIcon: IconButton(
                      onPressed:(){
                        setState(() {
                          showConfPassword=!showConfPassword;

                        });
                      } ,
                      icon: Icon(Icons.remove_red_eye_sharp),
                      color: Colors.grey,

                    ),


                  ),
                ),
              ),
              SizedBox(height: 30),

              RaisedButton(
                onPressed: () {
                   SweetAlert.show(context,
                      title: "Successfully updated",
                      style: SweetAlertStyle.success);

                  },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Text('Save changes', style: TextStyle( letterSpacing: 2,fontSize: 18, fontWeight: FontWeight.bold), ),
                color: Colors.grey[400],

              ),

            ],),
        ),

      ),


      );
  }
}

