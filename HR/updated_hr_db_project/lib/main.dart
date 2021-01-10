import 'package:flutter/material.dart';
import 'package:updated_hr_db_project/pages/home.dart';
import 'package:updated_hr_db_project/pages/profile.dart';
import 'package:updated_hr_db_project/pages/complaints.dart';
import 'package:updated_hr_db_project/pages/DeliveryMenHR.dart';
import 'package:updated_hr_db_project/pages/DM_detailsHR.dart';
import 'package:updated_hr_db_project/Rest_API.dart';
import 'package:updated_hr_db_project/pages/SalesMenHR.dart';
import 'package:updated_hr_db_project/pages/SM_deailsHR.dart';
import 'package:updated_hr_db_project/pages/Complaints_details_HR.dart';
import 'package:updated_hr_db_project/pages/DM_with_rating.dart';
import 'package:updated_hr_db_project/pages/DM_FeedbackHR.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/profile': (context)=> Profile(),
      '/complaints': (context)=> GeneralComplaints(),
      '/DeliveryMenHR': (context) =>DM_HR_Body(),
      '/DM_detailsHR': (context)=> DM_details(),
      '/SalesMenHR': (context) =>SM_HR_Body(),
      '/SM_deailsHR': (context)=> SM_details(),
      '/Complaints_details_HR': (context)=>  complaints_detailsHR(),
      '/DM_with_rating': (context) => DM_rating_HR_Body(),
      '/DM_FeedbackHR': (context) =>FeedbackDM()
    },

  ));
}