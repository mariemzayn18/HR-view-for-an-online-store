import 'package:flutter/material.dart';
import 'package:updated_hr_db_project/pages/DeliveryMenHR.dart';
import 'package:updated_hr_db_project/pages/home.dart';
import 'package:updated_hr_db_project/Rest_API.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:http/http.dart' as http;
import 'package:sweetalert/sweetalert.dart';

import 'package:url_launcher/url_launcher.dart';




class utils{
  static Future openLink({@required String url,}) => _launchUrl(url);
  static Future  _launchUrl(String url) async
  {
    if (await canLaunch(url) )
    {
      await launch(url);
    }

  }
  static Future openEmail({
    @required String toEmail,
    @required String subject,
    @required String body,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';

    await _launchUrl(url);
  }}



class DM_details extends StatefulWidget {

final DeliveryMen_HR DM;
const DM_details ({Key key, this.DM}):super(key:key);
  @override
  _DM_detailsState createState() => _DM_detailsState();
}

class _DM_detailsState extends State<DM_details> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:  LinearGradient(
            begin: Alignment.bottomCenter,
            colors: [
              Colors.teal[700],
              Colors.teal[400],
              Colors.teal[300],
              Colors.teal[700],
              Colors.teal[400],
              Colors.teal[700],
              Colors.teal[300],
              Colors.teal[400],
              Colors.teal[700],

            ],)),

      child: Scaffold(
      backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(child: Image.asset("assets/dm.jpg")),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText.rich(
                  TextSpan(
                      text: 'Name: ',
                      children: <TextSpan> [
                        TextSpan(
                            text:widget.DM.FirstName+ " "+widget.DM.LastName,
                            style: TextStyle(fontSize: 22, color: Colors.white, letterSpacing:2 )
                        ),
                      ],
                      style: TextStyle(fontSize: 25, color: Colors.grey[900], letterSpacing:2, fontWeight: FontWeight.bold )
                  ) ,),),

              SizedBox(height:4),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText.rich(
                  TextSpan(
                      text: 'ID: ',
                      children: <TextSpan> [
                        TextSpan(
                            text:'${widget.DM.id}',
                            style: TextStyle(fontSize: 22, color: Colors.white, letterSpacing:2 )
                        ),
                      ],
                      style: TextStyle(fontSize: 25, color: Colors.grey[900], letterSpacing:2, fontWeight: FontWeight.bold )
                  ) ,),

              ),
              ///>>>>>>>>>>>>>>>>>>>>>>>>>>> replace thiss with DM.rating
              SizedBox(height:4),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:AutoSizeText.rich(
                  TextSpan(
                      text: 'Rating: ',
                      children: <TextSpan> [
                        TextSpan(
                            text:'5',
                            style: TextStyle(fontSize: 22, color: Colors.white, letterSpacing:2 )
                        ),
                      ],
                      style: TextStyle(fontSize: 25, color: Colors.grey[900], letterSpacing:2, fontWeight: FontWeight.bold )
                  ) ,),
              ),

              SizedBox(height:4),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:AutoSizeText.rich(
                  TextSpan(
                      text: 'Phone Number: ',
                      children: <TextSpan> [
                        TextSpan(
                            text:"${widget.DM.PhoneNumber}",
                            style: TextStyle(fontSize: 22, color: Colors.white, letterSpacing:2 )
                        ),
                      ],
                      style: TextStyle(fontSize: 25, color: Colors.grey[900], letterSpacing:2, fontWeight: FontWeight.bold )
                  ) ,), ),
              SizedBox(height:4),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText.rich(
                  TextSpan(
                      text: 'Email: ',
                      children: <TextSpan> [
                        TextSpan(
                            text:widget.DM.email,
                            style: TextStyle(fontSize: 22, color: Colors.white, letterSpacing:2 )
                        ),
                      ],
                      style: TextStyle(fontSize: 25, color: Colors.grey[900], letterSpacing:2, fontWeight: FontWeight.bold )
                  ) ,),),
              SizedBox(height:4),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText.rich(
                  TextSpan(
                      text: 'Address: ',
                      children: <TextSpan> [
                        TextSpan(
                            text: 'Appartment: '+ widget.DM.AppartmentNumber+ "," +"\n"+"                 "+"Building: "+widget.DM.BuildingNumber+"," +"\n"+"                 "+widget.DM.StreetName+ ",\n"+"                 "+ widget.DM.Governorate+",\n"+"                 "+widget.DM.City,
                            style: TextStyle(fontSize: 22, color: Colors.white, letterSpacing:2 )
                        ),
                      ],
                      style: TextStyle(fontSize: 25, color: Colors.grey[900], letterSpacing:2, fontWeight: FontWeight.bold )
                  ) ,),
              ),
              SizedBox(height:4),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:  AutoSizeText.rich(
                  TextSpan(

                      text: 'Salary: ',
                      children: <TextSpan> [
                        TextSpan(
                            text: "${widget.DM.Salary}EGP",
                            style: TextStyle(fontSize: 22, color: Colors.white, letterSpacing:2 )
                        ),
                      ],
                      style: TextStyle(fontSize: 25, color: Colors.grey[900], letterSpacing:2, fontWeight: FontWeight.bold )
                  ) ,), ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                    )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width:200,

                                child: TextFormField(
                                  controller: myController,
                                  decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(7.0),)),
                                        hintText: 'Send a reward',
                                    prefixIcon: const Icon(Icons.attach_money_outlined,),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              RaisedButton(
                                color:Colors.green,
                                onPressed:()async{
                                if (myController.text!= ""){
                                  dynamic bonus_added= await AddBonus_DM(widget.DM.id, int.parse(myController.text));
                                  setState(() {
                                   SweetAlert.show(context,
                                       title: "Successfully rewarded "+ widget.DM.FirstName,
                                       style: SweetAlertStyle.success);

                                });}
                                else {
                                  setState(() {
                                    SweetAlert.show(context,
                                        title: "You haven't added a bonus",
                                        style: SweetAlertStyle.error);
                                  });
                                }
                                },
                                child: Text("Add bonus", style: TextStyle(color: Colors.white, fontSize: 20,)),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 10,),

                              RaisedButton(
                                color:Colors.redAccent[700],
                                onPressed: () async{

                                  utils.openEmail(
                                    toEmail:widget.DM.email,
                                    subject:  "",
                                    body: "",);

                                },
                                child: Text("Send warning", style: TextStyle(color: Colors.white, fontSize: 20,)),
                              ),

                            ],
                          ),
                        ),


                ))
      ]),
                  ),
                ),

    );
  }
}
