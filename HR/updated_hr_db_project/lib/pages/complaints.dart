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
      child: DefaultTabController(
          length:2,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor:  Colors.teal[400],

          bottom: TabBar(
              unselectedLabelColor: Colors.white54,
              indicatorColor: Colors.white,
              indicatorWeight: 4,
              labelStyle: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
              tabs:[
                Tab(text: "Complaints", ),
                Tab(text: "Resolved",)
              ]
            ),
          ),
          body: TabBarView(
            children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FutureBuilder(
                    future: GetComplaints_HR(),
                    builder: (context, snapshot){
                          if (snapshot.hasData)
                          {
                          List hr_complaints = snapshot.data;
                          if (hr_complaints.length!=0)
                            return complaints_list_HR(hr_complaints);
                          }
                          else if (snapshot.hasError){
                          return Text("${snapshot.error}");
                          }
                          return Center(child: Text('No complaints..', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),));

                    }
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder(
                    future: ShowResolvedComp(),

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
                      return Center(child: Text('No resolved complaints yet..', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),));

                    }
                ),
              ),


              ]
          ))
          ),

      );
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
                          builder: (context) => new complaints_detailsHR(
                            complaint: hr_complaints[index],
                          ),
                        ));},

                  )
  );
}


class ComplaintsCardHR extends StatefulWidget {
  final Complaints complaint;
  final Function press;
  const ComplaintsCardHR({Key key, this.complaint, this.press }): super(key:key);

  @override
  _ComplaintsCardHRState createState() => _ComplaintsCardHRState();
}

class _ComplaintsCardHRState extends State<ComplaintsCardHR> {
  bool _checkboxListTile = false;
  // void savve()async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.getBool('savestate')
  // }
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
                      SizedBox(height: 17,),
                      Text(
                        widget.complaint.message,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      style:TextStyle(color: Colors.red, fontSize: 16,fontStyle: FontStyle.italic),
                      ),
                      CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text('Resolved'),
                      value: _checkboxListTile,
                      onChanged: (value) async{
                        setState(() {
                          _checkboxListTile = !_checkboxListTile;

                        });
                        // SharedPreferences pref=await SharedPreferences.getInstance();
                        // pref.setBool('savestate', _checkboxListTile);
                      })],
                  ),
                )
                ],
              ),
            ),),
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




