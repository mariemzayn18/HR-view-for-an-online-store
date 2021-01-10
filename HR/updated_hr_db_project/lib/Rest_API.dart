import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class URLS {
  static const String BASE_URL = 'http://10.0.2.2:5000';
}

///------------------------------------------------------------------ HR's view---------> deliverymen details
Future<dynamic> GetDeliveryMen()async {

  final response = await http.get ('${URLS.BASE_URL}/deliveryMenHR');

  if(response.statusCode ==200){
    List jsonResponse=json.decode(response.body);
    return jsonResponse.map((dm) =>new DeliveryMen_HR.fromJson(dm)).toList();
  }
  else{
    throw Exception("Failed To load Delivery men details from API");
  }

}
Future<dynamic> GetDeliveryMenSearchedRating(int rate)async {

  var rating= {
    'rate': '$rate',
  };
  final response =  await http.post('http://10.0.2.2:5000/DeliveryMenRateHR', body: rating);
  if(response.statusCode ==200){
    List jsonResponse=json.decode(response.body);
    return jsonResponse.map((dm) =>new DeliveryMen_HR.fromJson(dm)).toList();
  }
  else{
    throw Exception("Failed To load Delivery men details from API");
  }

}

Future<dynamic> GetDeliveryMenRating(int ID)async {

  Map<String,dynamic> id= {'ID': '$ID'};
  final response =  await http.post('http://10.0.2.2:5000/RateDM_HR', body: id);
  print(json.decode(response.body));
  if(response.statusCode ==200){
    dynamic jsonResponse=json.decode(response.body);
    return (jsonResponse[0]);
  }
  else{
    throw Exception("Failed To load Delivery men details from API");
  }

}




Future<dynamic> AddBonus_DM(int DM_id, int bonus)async {

  var bonus_req= {
    'Bonus': '$bonus',
    'Id': '$DM_id'
    };
final response =  await http.post('http://10.0.2.2:5000/deliveryMenBonus', body: bonus_req);
if(response.statusCode ==200){
  return json.decode(response.body);
}
else{
  throw Exception("Failed To update DM's salary from API");
}
}

class DeliveryMen_HR {
  final String FirstName;
  final String LastName;
  final String Governorate;
  final String City;
  final String StreetName;
  final String email;
  //String image;
  final int id;
  final String BuildingNumber;
  final String AppartmentNumber;
  final int PhoneNumber;
  final int Salary;
  final int Bonus;
  //double rating;
  DeliveryMen_HR({this.FirstName, this.LastName, this.Governorate,this.City, this.StreetName, this.email, this.id,this.BuildingNumber,this.AppartmentNumber,this.PhoneNumber,this.Salary,this.Bonus});

  factory DeliveryMen_HR.fromJson(Map<String,dynamic>json ){
    return DeliveryMen_HR(
        FirstName: json['FirstName'],
        LastName: json['SecondName'],
        Governorate: json['Governorate'],
        City: json['City'],
        StreetName: json['StreetName'],
        email: json['Email'],
        id: json['Id'],
        BuildingNumber: json['BuildingNumber'],
        AppartmentNumber: json['AppartmentNumber'],
        PhoneNumber: json['PhoneNumber'],
        Salary: json['Salary'],
        Bonus:json['Bonus']);
  }
}


///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> HR's view---------> salesmen details

Future<dynamic> GetSalesMen()async {

  final response = await http.get ('${URLS.BASE_URL}/SalesMenHR');

  if(response.statusCode ==200){
    List jsonResponse=json.decode(response.body);
    return jsonResponse.map((dm) =>new SalesMen_HR.fromJson(dm)).toList();
  }
  else{
    throw Exception("Failed To load Sales men details from API");
  }

}


class SalesMen_HR {
  final String FirstName;
  final String LastName;
  final String Governorate;
  final String City;
  final String StreetName;
  final String email;
  //String image;
  final int id;
  final String BuildingNumber;
  final String AppartmentNumber;
  final int PhoneNumber;
  final int Salary;
  SalesMen_HR({this.FirstName, this.LastName, this.Governorate,this.City, this.StreetName, this.email, this.id,this.BuildingNumber,this.AppartmentNumber,this.PhoneNumber,this.Salary});

  factory SalesMen_HR.fromJson(Map<String,dynamic>json ){
    return SalesMen_HR(
        FirstName: json['FirstName'],
        LastName: json['SecondName'],
        Governorate: json['Governorate'],
        City: json['City'],
        StreetName: json['StreetName'],
        email: json['Email'],
        id: json['Id'],
        BuildingNumber: json['BuildingNumber'],
        AppartmentNumber: json['AppartmentNumber'],
        PhoneNumber: json['PhoneNumber'],
        Salary: json['Salary'],
       );
  }
}

///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> HR's view---------> Customers details
Future<dynamic> GetCustomers_HR(int customer_id)async {

  var id_searching= {
    'Id': '$customer_id'
  };

  final response = await http.post ('${URLS.BASE_URL}/CustomerHR', body: id_searching);

  if(response.statusCode ==200){
    List jsonResponse=json.decode(response.body);
    return jsonResponse.map((cust) =>new Customer.fromJson(cust)).toList();
  }
  else{
    throw Exception("Failed To load Delivery men details from API");
  }

}

class Customer {
  final String FirstName;
  final String LastName;
  final String Governorate;
  final String City;
  final String StreetName;
  final String email;
  final int id;
  final String gender;
  final String BuildingNumber;
  final String AppartmentNumber;
  final int PhoneNumber;

  Customer({this.FirstName, this.LastName, this.Governorate,this.City, this.StreetName, this.email, this.id,this.gender,this.BuildingNumber,this.AppartmentNumber,this.PhoneNumber});


  factory Customer.fromJson(Map<String,dynamic>json ){
    return Customer(
        FirstName: json['FirstName'],
        LastName: json['SecondName'],
        Governorate: json['Governorate'],
        City: json['City'],
        StreetName: json['StreetName'],
        email: json['Email'],
        gender: json['Gender'],
        id: json['Id'],
        BuildingNumber: json['BuildingNumber'],
        AppartmentNumber: json['AppartmentNumber'],
        PhoneNumber: json['PhoneNumber'],

       );
  }
}

///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> HR's view---------> Complaints details

Future<dynamic> GetComplaints_HR()async {

  final response = await http.get ('${URLS.BASE_URL}/ComplaintsHR');

  if(response.statusCode ==200){
    print("comp");
    List jsonResponse=json.decode(response.body);
    return jsonResponse.map((cust) =>new Complaints.fromJson(cust)).toList();
  }
  else{
    throw Exception("Failed To load complaints from API");
  }

}


Future<dynamic> Send_respond(String respond, int customerid)async {

  var myrespond= {
    'respond': respond,
    'customerid': '$customerid'
  };
  print (respond);
  final response =  await http.post('http://10.0.2.2:5000/Respond_complaint', body: myrespond);
  if(response.statusCode ==200){
    return json.decode(response.body);
  }
  else{
    throw Exception("Failed To send response from API");
  }
}


Future<dynamic> ShowResolvedComp()async {

  final response = await http.get ('${URLS.BASE_URL}/resolvedshow');

  if(response.statusCode ==200){
    List jsonResponse=json.decode(response.body);
    return jsonResponse.map((cust) =>new Complaints.fromJson(cust)).toList();
  }
  else{
    throw Exception("Failed To show resolved messages from API");
  }

}



class Complaints {

  final int id;
  final int Customer_id;
  final String message;
  final String respond;
  Complaints({this.id,this.Customer_id,this.message,this.respond});


  factory Complaints.fromJson(Map<String,dynamic>json ){
    return Complaints(

      id: json['Id'],
      Customer_id: json['CustomerId'],
      message: json['Message'],
      respond: json ['respond']

    );
  }
}

  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> HR's view-----------------> feedback on deliverymen


Future<dynamic> GetFB_DM_HR()async {

  final response = await http.get ('${URLS.BASE_URL}/FeedbackDMHR');

  if(response.statusCode ==200){
    List jsonResponse=json.decode(response.body);
    return jsonResponse.map((cust) =>new FeedBackHR.fromJson(cust)).toList();
  }
  else{
    throw Exception("Failed To load reviews from API");
  }

}


Future<dynamic> DM_Feedback_details(int id)async {

  var id_searching= {
    'Id': '$id'
  };

  final response = await http.post ('${URLS.BASE_URL}/DM_Feedback_details', body: id_searching);
   ///print('I am hereee');
  if(response.statusCode ==200){
    print('dkhaallltttt');

    List jsonResponse=json.decode(response.body);

   /// print((jsonResponse.map((cust) =>new DeliveryMen_HR.fromJson(cust)).toList())[0]);
    return jsonResponse.map((cust) =>new DeliveryMen_HR.fromJson(cust)).toList()[0];
  }
  else{
    throw Exception("Failed To load Delivery men details from API");
  }

}




  class FeedBackHR {

  final int id;
  final int rate;
  final int Customer_id;
  final int dm;
  final String message;
  //final String respond;
  FeedBackHR({this.id,this.rate,this.Customer_id,this.dm, this.message});


  factory FeedBackHR.fromJson(Map<String,dynamic>json ){
  return FeedBackHR(
  id: json['Id'],
  Customer_id: json['CustomerId'],
  message: json['Message'],
  dm: json ['DeliveryManId'],
  rate: json["Rate"]
  );
  }
  }

  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Respond to complaints (Customer view) >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


Future<dynamic> ShowResolvedComp_Customer(int id)async {
  var idd={
    'Id': '$id'
  };

  final response = await http.post ('${URLS.BASE_URL}/resolvedshowCustomer',  body: idd);

  if(response.statusCode ==200){
    List jsonResponse=json.decode(response.body);
    return jsonResponse.map((cust) =>new Complaints.fromJson(cust)).toList();
  }
  else{
    throw Exception("Failed To show resolved messages from API");
  }

}








