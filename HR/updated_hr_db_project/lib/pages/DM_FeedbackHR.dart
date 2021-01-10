import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:updated_hr_db_project/Rest_API.dart';
import 'package:collapsible/collapsible.dart';
import 'package:updated_hr_db_project/pages/Complaints_details_HR.dart';
import 'package:updated_hr_db_project/pages/resolvedcomplaints.dart';
import 'package:updated_hr_db_project/pages/feedback_DM_details_HR.dart';



class FeedbackDM extends StatefulWidget {
  @override
  _FeedbackDMState createState() => _FeedbackDMState();
}

class _FeedbackDMState extends State<FeedbackDM> {

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
            backgroundColor:  Colors.teal[400],
            elevation:0,
            title: Text('Reviews on delivery men')
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child:  FutureBuilder(
                  future: GetFB_DM_HR(),
                  builder: (context, snapshot){
                    if (snapshot.hasData)
                    {
                      List hr_feedback = snapshot.data;
                      if (hr_feedback.length!=0)
                        return complaints_list_HR(hr_feedback);
                    }
                    else if (snapshot.hasError){
                      return Text("${snapshot.error}");
                    }
                    return Center(child: Text('No reviews..', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),));

                  }


          )),

    ));
  }
}




GridView complaints_list_HR (hr_complaints)
{

  return GridView.builder (
      itemCount: hr_complaints.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 11,
        crossAxisSpacing: 11,
        childAspectRatio: 2.5,
      ),

      itemBuilder: (context, index) =>  ComplaintsCardHR(
        complaint: hr_complaints[index],
        press: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => new feedback_detailsHR(
                  complaint: hr_complaints[index],
                ),
              ));},

      )
  );
}


class ComplaintsCardHR extends StatefulWidget {
  final FeedBackHR complaint;
  final Function press;
  const ComplaintsCardHR({Key key, this.complaint, this.press }): super(key:key);

  @override
  _ComplaintsCardHRState createState() => _ComplaintsCardHRState();
}

class _ComplaintsCardHRState extends State<ComplaintsCardHR> {
  bool _checkboxListTile = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.press,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal[100],
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
                      height: 80,
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
                        Text("Customer's ID: ${widget.complaint.Customer_id}", style:TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                        SizedBox(height: 12,),
                        Text("Deliveryman's ID: ${widget.complaint.dm}", style:TextStyle(color: Colors.black, fontSize: 18)),
                        SizedBox(height: 17,),
                        Text(
                          "Review :"+widget.complaint.message,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style:TextStyle(color: Colors.red, fontSize: 16,fontStyle: FontStyle.italic),
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



