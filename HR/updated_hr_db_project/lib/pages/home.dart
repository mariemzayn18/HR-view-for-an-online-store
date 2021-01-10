import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:updated_hr_db_project/pages/profile.dart';
import 'package:updated_hr_db_project/pages/complaints.dart';
import 'package:updated_hr_db_project/pages/DeliveryMenHR.dart';
import 'package:updated_hr_db_project/pages/SalesMenHR.dart';
import 'package:updated_hr_db_project/pages/DM_with_rating.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:updated_hr_db_project/pages/DM_FeedbackHR.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSearching=false;
  final myController = TextEditingController();
  List <int> DM_Rate=[0,1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.teal[400],

        elevation: 0,
           title:  Text('Home page')
                ),



      drawer: Drawer(
          child: Container(
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
            child: ListView(
              children: [

                ListTiles('My Account', Icons.person, (){Navigator.pushNamed(context, '/profile');}),
                ListTiles('Products', Icons.shopping_bag_outlined, (){}), // data of all products and their ratings
                ListTiles('Sales men', Icons.assignment_ind_rounded, (){Navigator.pushNamed(context, '/SalesMenHR');}), // data of all sales men
                ListTiles('Delivery men', Icons.delivery_dining, (){Navigator.pushNamed(context, '/DeliveryMenHR');}) , // data of all delivery men and their ratings
                ListTiles('Complaints', Icons.article_rounded, (){Navigator.pushNamed(context, '/complaints');}),
                ListTiles("Deliverymen's reviews", Icons.article_rounded, (){Navigator.pushNamed(context, '/DM_FeedbackHR');}),
                ListTiles('Sign out', Icons.logout, (){}), // go to the sign_in page

                  SizedBox(height: 50,),

                 Container(
                 decoration: BoxDecoration(
                 shape: BoxShape.circle,
                   color: Colors.grey[300],
                  ),
                  child: IconButton(icon: Icon(Icons.close_rounded, ), onPressed: () {Navigator.pop(context);},)
                 )


        ]),
          ),
        ),

            body: Container(
            color: Colors.teal[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                        height:190,
                        //width: 395,
                        decoration: BoxDecoration(
                        color: Colors.teal[100],
                        borderRadius: BorderRadius.circular(18),),

                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Get all delivery men with rating: ', style:TextStyle(color:Colors.teal[400], fontSize: 20, fontWeight: FontWeight.bold)),

                                SizedBox(height:14,),
                              TextFormField(
                                controller:myController,
                                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(15.0),

                                    ),
                                  ),
                                  hintText: 'Enter values from 0-5',
                                  prefixIcon: const Icon(Icons.search, color: Colors.blueGrey,),

                                ),
                                keyboardType: TextInputType.number,

                              ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                      color:Colors.teal[400],
                                      onPressed:()async{
                                        if (myController.text!= "" && int.parse(myController.text) >=0 && int.parse(myController.text) <=5 ){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DM_rating_HR_Body (rating:int.parse(myController.text)),
                                                ),
                                              );

                                        }
                                      },
                                      child: Text("Search", style: TextStyle(color: Colors.white, fontSize: 20,)),

                                    ),
                                  ),
                                ),

                              ],
                            ),
                          )
                        )
                ),
                      )],
              ),










            )
    );
  }

}

class ListTiles extends StatelessWidget {
  String text;
  IconData icon;
  Function ontap;

  ListTiles(this.text, this.icon, this.ontap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ontap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: Colors.white),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    )

                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_right, color: Colors.white),

          ],
        ),
      ),
    );
  }
}
