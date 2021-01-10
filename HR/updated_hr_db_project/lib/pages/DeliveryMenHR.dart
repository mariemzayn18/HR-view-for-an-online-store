import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:updated_hr_db_project/pages/DM_detailsHR.dart';
import 'package:updated_hr_db_project/Rest_API.dart';

class DM_HR_Body extends StatefulWidget {
  @override
  _DM_HR_BodyState createState() => _DM_HR_BodyState();
}

class _DM_HR_BodyState extends State<DM_HR_Body> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:  Colors.teal[400],
          elevation: 0,
          title: Text('Delivery men',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
          future: GetDeliveryMen(),
       builder: (context, snapshot){
          if (snapshot.hasData)
            {
              List DM_list = snapshot.data;
              if (DM_list.length==0)               ////////////////////// NO DELIVERY MEN
                Text('No delivery men are hired');
            return dm_lists(DM_list);
            }
          else if (snapshot.hasError){
          return Text("${snapshot.error}");
       }
       // ignore: missing_return
         return Container();
       }

    ,),
        )); }}


GridView dm_lists(DM_list)
{
  return GridView.builder(
          itemCount: DM_list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 11,
          crossAxisSpacing: 11,
          childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) => DMCard(
                    dm: DM_list[index],
                    press: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DM_details(
                                    DM: DM_list[index],
                                  ),
                            )),
                  ));
}


class DMCard extends StatelessWidget {
            final DeliveryMen_HR dm;
            final Function press;
            //final dynamic rate;
            const DMCard({Key key, this.dm, this.press }): super(key:key);

            @override
            Widget build(BuildContext context) {
              return GestureDetector(
                onTap: press,
                child: Card(
                    child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
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

                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(height: 10,),
                   //////////////////////////////////------------ image
                    Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                    image: AssetImage("assets/dm.jpg"),
                    fit: BoxFit.fill
                    ),
                    )),

                    SizedBox(height: 20,),

                    Center(child: Text(dm.FirstName+ " "+ dm.LastName, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),)),
                    SizedBox(height: 4,),
                    Center(child: Text("ID: ${dm.id}", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),)),
                    SizedBox(height: 5,),

                    ///////////////////////// ------ RATINGGGG
                    Center(
                    child: RatingBar.builder(
                    itemCount: 5,
                    initialRating: 4,    /// (replace this from the rating come from the database)
                    itemSize: 30,
                    allowHalfRating: true,
                    itemBuilder: (context, _) => Icon(
                          Icons.star,
                    color: Colors.amber,
                    size: 10,
                    ),

                    ),

                    ),
                    SizedBox(height: 8,),


                    ],
                    ),
                    ),)
              );
            }
          }

// FutureBuilder(
// future: GetDeliveryMenRating(DM_list[index].id),
// builder: (context, snapshot) {
// if (snapshot.hasData) {
// dynamic rating = snapshot.data;
// return DMCard(
// dm: DM_list[index],
// rate: rating,
// press: () =>
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// DM_details(
// DM: DM_list[index],
// ),
// )),
// );
// }
// else if (snapshot.hasError) {
// return Text("${snapshot.error}");
// }
// return Container();
// })
          








/// ---------------> lw el deliveryman tele3 lee soora
// Container(
// width: 200,
// height: 150,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// image: DecorationImage(
// image: AssetImage(dm.image),
// fit: BoxFit.fill
// ),
// )),

