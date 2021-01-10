import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:updated_hr_db_project/Rest_API.dart';
import 'package:auto_size_text/auto_size_text.dart';

class customer_HR extends StatelessWidget {
  final Customer customer;
  const customer_HR ({Key key, this.customer}):super(key:key);
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
          body:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height:400,
              width: 395,
              decoration: BoxDecoration(
              color: Colors.teal[100],
              borderRadius: BorderRadius.circular(18),),

             child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
               Padding(
               padding: const EdgeInsets.all(8.0),
                 child:AutoSizeText.rich(
                  TextSpan(
                      text: 'Name: ',
                      children: <TextSpan> [
                        TextSpan(
                            text:customer.FirstName+ " "+customer.LastName,
                            style: TextStyle(fontSize: 20, color: Colors.teal[400], letterSpacing:2 )
                        ),
                      ],
                      style: TextStyle(fontSize: 22, color: Colors.grey[900], letterSpacing:2, fontWeight: FontWeight.bold )
                  ) ,),),

                SizedBox(height:4),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText.rich(
                    TextSpan(
                        text: 'ID: ',
                        children: <TextSpan> [
                          TextSpan(
                              text:'${customer.id}',
                              style: TextStyle(fontSize: 20, color: Colors.teal[400], letterSpacing:2 )
                          ),
                        ],
                        style: TextStyle(fontSize: 22, color: Colors.grey[900], letterSpacing:2, fontWeight: FontWeight.bold )
                    ) ,),

                ),
                SizedBox(height:4),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText.rich(
                    TextSpan(
                        text: 'Gender: ',
                        children: <TextSpan> [
                          TextSpan(
                              text:customer.gender,
                              style: TextStyle(fontSize: 20, color: Colors.teal[400], letterSpacing:2 )
                          ),
                        ],
                        style: TextStyle(fontSize: 22, color: Colors.grey[900], letterSpacing:2, fontWeight: FontWeight.bold )
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
                              text:"${customer.PhoneNumber}",
                              style: TextStyle(fontSize: 20, color: Colors.teal[400], letterSpacing:2 )
                          ),
                        ],
                        style: TextStyle(fontSize: 22, color: Colors.grey[900], letterSpacing:2, fontWeight: FontWeight.bold )
                    ) ,), ),
                SizedBox(height:4),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText.rich(
                    TextSpan(
                        text: 'Email: ',
                        children: <TextSpan> [
                          TextSpan(
                              text:customer.email,
                              style: TextStyle(fontSize: 20, color: Colors.teal[400], letterSpacing:2 )
                          ),
                        ],
                        style: TextStyle(fontSize: 22, color: Colors.grey[900], letterSpacing:2, fontWeight: FontWeight.bold )
                    ) ,),),
                SizedBox(height:4),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText.rich(
                    TextSpan(
                        text: 'Address: ',
                        children: <TextSpan> [
                          TextSpan(
                              text: 'Appartment: '+ customer.AppartmentNumber+ "," +"\n"+"                "+"Building: "+customer.BuildingNumber+"," +"\n"+"                "+customer.StreetName+ ",\n"+"                "+ customer.Governorate+",\n"+"                "+customer.City,
                              style: TextStyle(fontSize: 20, color: Colors.teal[400], letterSpacing:2 )
                          ),
                        ],
                        style: TextStyle(fontSize: 22, color: Colors.grey[900], letterSpacing:2, fontWeight: FontWeight.bold )
                    ) ,),
                ),
                SizedBox(height:4),


            ] ),

             )


            ),

          )));
  }
}

