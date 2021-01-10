import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:updated_hr_db_project/Rest_API.dart';
import 'package:collapsible/collapsible.dart';
import 'package:updated_hr_db_project/pages/Complaints_details_HR.dart';
import 'package:updated_hr_db_project/pages/resolvedcomplaints.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GeneralComplaints extends StatefulWidget {
  @override
  _GeneralComplaintsState createState() => _GeneralComplaintsState();
}

class _GeneralComplaintsState extends State<GeneralComplaints> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[50],
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor:  Colors.teal[400],

            ),

          body:
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FutureBuilder(
                      future: ShowResolvedComp_Customer(3),

                      builder: (context, snapshot){
                        if (snapshot.hasData)
                        {
                          List hr_complaints = snapshot.data;
                          if (hr_complaints.length!=0)
                            return resolved_list_HR(hr_complaints);
                        }
                        else if (snapshot.hasError){
                          return Text("${snapshot.error}");
                        }
                        return Center(child: Text('No mesages..', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),));

                      }
                  ),
                ),


    )

    );
  }
}








GridView resolved_list_HR (hr_complaints)
{

  return GridView.builder (
      itemCount: hr_complaints.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 11,
        crossAxisSpacing: 11,
        childAspectRatio: 3.5,
      ),

      itemBuilder: (context, index) =>  ResolvedCardHR(
        complaint: hr_complaints[index],
        press: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => new resolved_detailsHR(
                  complaint: hr_complaints[index],
                ),
              ));},

      )
  );
}


class ResolvedCardHR extends StatelessWidget {
  final Complaints complaint;
  final Function press;
  const ResolvedCardHR({Key key, this.complaint, this.press }): super(key:key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(18),),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //////////////////////////////////------------ image
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/sm.png"),
                            fit: BoxFit.fill
                        ),
                      )),
                  SizedBox(width: 23,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12,),
                        Text("Customer's ID: ${complaint.Customer_id}", style:TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                        SizedBox(height: 17,),
                        Text(
                          complaint.message,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style:TextStyle(color: Colors.grey, fontSize: 16,fontStyle: FontStyle.italic),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),),
        )
    );
  }
}




