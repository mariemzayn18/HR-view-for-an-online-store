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




class SM_details extends StatefulWidget {

  final SalesMen_HR SM;
  const SM_details ({Key key, this.SM}):super(key:key);

  @override
  _SM_detailsState createState() => _SM_detailsState();
}

class _SM_detailsState extends State<SM_details> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final SalaryController = TextEditingController();

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

              Center(child: Image.asset("assets/sm.png")),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText.rich(
                  TextSpan(
                      text: 'Name: ',
                      children: <TextSpan> [
                        TextSpan(
                            text:widget.SM.FirstName+ " "+widget.SM.LastName,
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
                            text:'${widget.SM.id}',
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
                            text:"${widget.SM.PhoneNumber}",
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
                            text:widget.SM.email,
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
                            text: 'Appartment: '+ widget.SM.AppartmentNumber+ "," +"\n"+"                 "+"Building: "+widget.SM.BuildingNumber+"," +"\n"+"                 "+widget.SM.StreetName+ ",\n"+"                 "+ widget.SM.Governorate+",\n"+"                 "+widget.SM.City,
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
                            text: "${widget.SM.Salary}EGP",
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
                    child:

                    RaisedButton(
                      color:Colors.teal,
                      onPressed: () async{

                        utils.openEmail(
                          toEmail:widget.SM.email,
                          subject:  "",
                          body: "",);

                      },
                      child: Text("Contact", style: TextStyle(color: Colors.white, fontSize: 20,)),
                    ),


                        ))),


                ],
                    ),
                  ),
                ),
              );




  }
}
