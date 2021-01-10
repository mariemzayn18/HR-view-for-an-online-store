import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:updated_hr_db_project/Rest_API.dart';
import 'package:http/http.dart' as http;
import 'package:sweetalert/sweetalert.dart';
import 'package:updated_hr_db_project/pages/complaint_customer_detailsHR.dart';
import 'package:sweetalert/sweetalert.dart';


class resolved_detailsHR extends StatefulWidget {

  final Complaints complaint;
  const resolved_detailsHR ({Key key, this.complaint}):super(key:key);
  @override
  _resolved_detailsHRState createState() => _resolved_detailsHRState();
}

class _resolved_detailsHRState extends State<resolved_detailsHR> {

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

  return ListView.builder(
      itemCount:1,
      itemBuilder: ( context,index) {
        return Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                        borderRadius: BorderRadius.circular(18),),
                      child: Card(
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(child: Text(customer[index]
                                        .FirstName + " " + customer[index]
                                        .LastName, style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold))),
                                    SizedBox(height: 5),
                                    Center(child: Text("< " +
                                        customer[index].email + " >",
                                        style: TextStyle(color: Colors.black,
                                            fontSize: 20))),

                                    SizedBox(height: 5),
                                    Center(child: Text("ID: ${complaint
                                        .Customer_id}", style: TextStyle(
                                      color: Colors.black, fontSize: 20,),)),


                                    SizedBox(height: 28),
                                    Text(complaint.message,
                                        style: TextStyle(color: Colors.red,
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic)),
                                  ]))))),

              SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(18),),
                      child: Card(
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                  children: [
                                    Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Center(child: Text(
                                              customer[index].FirstName + " " +
                                                  customer[index].LastName,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight
                                                      .bold))),
                                          SizedBox(height: 5),
                                          Center(child: Text(
                                              "< " + customer[index].email +
                                                  " >", style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20))),

                                          SizedBox(height: 13),
                                          Text(complaint.respond,
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20,
                                                  fontStyle: FontStyle.italic)),
                                        ])
                                  ]))))),
              SizedBox(height: 10),
              RaisedButton(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      new customer_HR(
                        customer: customer[index],
                      ),
                    ));
              },
                  color: Colors.teal[300],
                  child: Text("Customer details",
                      style: TextStyle(color: Colors.white, fontSize: 18))),


            ]);
      });
}

