import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:updated_hr_db_project/pages/SM_deailsHR.dart';
import 'package:updated_hr_db_project/Rest_API.dart';

class SM_HR_Body extends StatefulWidget {
  @override
  _SM_HR_BodyState createState() => _SM_HR_BodyState();
}

class _SM_HR_BodyState extends State<SM_HR_Body> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:  Colors.teal[400],
          elevation: 0,
          title: Text('Sales men',
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
            future: GetSalesMen(),
            builder: (context, snapshot){
              if (snapshot.hasData)
              {
                List SM_list = snapshot.data;
                if (SM_list.length==0)               ////////////////////// NO Sales MEN
                  Text('No sales men are hired');
                return sm_lists(SM_list);
              }
              else if (snapshot.hasError){
                return Text("${snapshot.error}");
              }
              return Container();
            }

            ,),
        )); }}


GridView sm_lists(SM_list)
{
  return GridView.builder(
      itemCount: SM_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 11,
        crossAxisSpacing: 11,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) => SMCard(
        sm: SM_list[index],
        press: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SM_details(
                SM: SM_list[index],
              ),
            )),
      ));
}


class SMCard extends StatelessWidget {
  final SalesMen_HR sm;
  final Function press;
  const SMCard({Key key, this.sm, this.press }): super(key:key);

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
                          image: AssetImage("assets/sm.png"),
                          fit: BoxFit.fill
                      ),
                    )),

                SizedBox(height: 20,),

                Center(child: Text(sm.FirstName+ " "+ sm.LastName, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),)),
                SizedBox(height: 4,),
                Center(child: Text("ID: ${sm.id}", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),)),
                SizedBox(height: 5,),




              ],
            ),
          ),)
    );
  }
}







/// ---------------> lw el salesman tele3 lee soora
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

