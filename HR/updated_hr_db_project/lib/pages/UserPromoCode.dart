import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsePromoCode extends StatefulWidget {
  @override
  _UsePromoCodeState createState() => _UsePromoCodeState();
}

class _UsePromoCodeState extends State<UsePromoCode> {

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Container(
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
          body: Center(
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
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                         TextFormField(
                        controller: myController,
                        decoration: InputDecoration(
                        border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                        const Radius.circular(7.0),)),
                        hintText: 'Write a promo code.. ',
                        prefixIcon: const Icon(Icons.attach_money_outlined,),
                        ),
                        ),

                        RaisedButton(
                            color: Colors.teal[300],
                           child:  Text("Use promocode",style: TextStyle(color: Colors.white,fontSize: 18) )
    ),
    ]
                    ),
                     SizedBox(height: 4,),
                     Text("Total payment: ",style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10,),
                      RaisedButton(
                      color: Colors.green,
                      child:  Text("Submit order",style: TextStyle(color: Colors.white,fontSize: 18) )
                      ),

    ]),
        ))))));

  }
}







