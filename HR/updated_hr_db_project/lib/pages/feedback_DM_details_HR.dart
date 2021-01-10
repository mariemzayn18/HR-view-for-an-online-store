import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:updated_hr_db_project/Rest_API.dart';
import 'package:http/http.dart' as http;
import 'package:sweetalert/sweetalert.dart';
import 'package:updated_hr_db_project/pages/complaint_customer_detailsHR.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:updated_hr_db_project/pages/DM_detailsHR.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
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



class feedback_detailsHR extends StatefulWidget {

  final FeedBackHR complaint;
  const feedback_detailsHR ({Key key, this.complaint}):super(key:key);
  @override
  _feedback_detailsHRState createState() => _feedback_detailsHRState();
}

class _feedback_detailsHRState extends State<feedback_detailsHR> {

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.teal[50],
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: FutureBuilder(
                future: GetCustomers_HR(widget.complaint.Customer_id) ,
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                  {
                    dynamic customer= snapshot.data;

                    return view_complaint(customer,widget.complaint,widget.complaint.dm);
                  }
                  else if (snapshot.hasError){
                    return Text("${snapshot.error}");
                  }
                  return Container();
                })


        ));
  }
}

ListView view_complaint(customer,complaint,dmid)
{
  final myController = TextEditingController();


  return ListView.builder(
      itemCount:1,
      itemBuilder: ( context,index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height:230,
                  decoration: BoxDecoration(
                    color: Colors.teal[100],
                    borderRadius: BorderRadius.circular(18),),
                  child: Card(
                      child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(child: Text(customer[index].FirstName+ " "+customer[index].LastName,style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold))),
                                SizedBox(height:5),
                                Center(child: Text("< "+customer[index].email+" >",style: TextStyle(color: Colors.black, fontSize: 20))),

                                SizedBox(height:5),
                                Center(child: Text("ID: ${complaint.dm}", style:TextStyle(color: Colors.black, fontSize: 20,),)),



                                SizedBox(height:28),
                                Container(
                                  width:400,
                                  height: 70,
                                  color: Colors.teal[50],
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SingleChildScrollView(
                                        child: Text("Review: "+complaint.message,style: TextStyle(color: Colors.red, fontSize: 20, fontStyle: FontStyle.italic)),
                                      ),
                                    ),
                                  ),
                                )])))

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  SizedBox(height: 9,),

                      RaisedButton(
                          onPressed: () async{

                              utils.openEmail(
                                  toEmail:customer[index].email,
                                  subject:  "",
                                   body: "",);


                          }

                          , color: Colors.teal[300], child: Text("Respond",style: TextStyle(color: Colors.white,fontSize: 18) )),

                  SizedBox(height:16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => new customer_HR(
                                customer: customer[index],
                              ),
                            ));


                      }, color: Colors.teal[300], child: Text("Customer details",style: TextStyle(color: Colors.white,fontSize: 18) )),
                      RaisedButton(onPressed: (){
                        FutureBuilder(
                         future: DM_Feedback_details(complaint.dm),
                          builder: (context, snapshot) {
                          print("asdsad");
                          if (snapshot.hasData) {
                            dynamic deliver= snapshot.data;
                            print(snapshot.data);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => new DM_details(
                                    DM: deliver,
                                  ),
                                ));

                          }
                         else  if (snapshot.hasError)
                            return Text("${snapshot.error}");
                          print("whaaatt");
                          return Container();
                        }

                        );


                      }, color: Colors.teal[300], child: Text("Deliveryman details",style: TextStyle(color: Colors.white,fontSize: 18) )),
                    ],
                  ),

                ],
              ),
            )
          ],
        );
      }
  );
}


CreatAlertDialog (BuildContext context )
{
  return showDialog( context: context, builder: (context){
    return AlertDialog(
      title: Text("You have successfully responded to this customer"),
      actions: <Widget>[
        MaterialButton(
            color: Colors.teal,
            elevation:5,
            child: Text ("OK" , style: TextStyle(
                color: Colors.white,
                fontSize: 13
            ),),
            onPressed: (){
              Navigator.of(context).pop();
            })
      ],

    );
  }
  );
}

