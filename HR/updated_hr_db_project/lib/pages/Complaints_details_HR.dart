import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:updated_hr_db_project/Rest_API.dart';
import 'package:http/http.dart' as http;
import 'package:sweetalert/sweetalert.dart';
import 'package:updated_hr_db_project/pages/complaint_customer_detailsHR.dart';
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




class complaints_detailsHR extends StatefulWidget {

  final Complaints complaint;
  const complaints_detailsHR ({Key key, this.complaint}):super(key:key);
  @override
  _complaints_detailsHRState createState() => _complaints_detailsHRState();
}

class _complaints_detailsHRState extends State<complaints_detailsHR> {

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

              return view_complaint(customer,widget.complaint);
            }
            else if (snapshot.hasError){
              return Text("${snapshot.error}");
              }
                   return Container();
            })


    ));
  }
}

ListView view_complaint(customer,complaint)
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
                  height:600,
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
                Center(child: Text("ID: ${complaint.Customer_id}", style:TextStyle(color: Colors.black, fontSize: 20,),)),



                SizedBox(height:28),
                Text(complaint.message,style: TextStyle(color: Colors.red, fontSize: 20, fontStyle: FontStyle.italic)),

       ])))

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  SizedBox(height: 9,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width:250,
                        child: TextFormField(
                          controller: myController,
                          maxLines: 11,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(7.0),)),
                            hintText: 'Send a message.. ',
                          ),
                        ),
                      ),

                      RaisedButton(
                      onPressed: () async{
                        if (myController.text!="")
                          {
                            dynamic res= await Send_respond(myController.text,complaint.Customer_id );
                              CreatAlertDialog(context);

                              }
                          }

                      , color: Colors.teal[300], child: Text("Respond",style: TextStyle(color: Colors.white,fontSize: 18) )),
                    ],
                  ),
                  SizedBox(height:13),
                  RaisedButton(
                    color:Colors.teal[300],
                    onPressed: () async{

                      utils.openEmail(
                        toEmail:customer[index].email,
                        subject:  "",
                        body: "",);
                    },
                    child: Text("Contact", style: TextStyle(color: Colors.white, fontSize: 20,)),


                  ),
                  SizedBox(height:13),
                  RaisedButton(onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => new customer_HR(
                        customer: customer[index],
                      ),
                    ));


                  }, color: Colors.teal[300], child: Text("Customer details",style: TextStyle(color: Colors.white,fontSize: 18) )),
            ])
            )],
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