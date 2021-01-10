// import 'package:flutter/material.dart';
// import 'package:expandable_text/expandable_text.dart';
//
//
//
// TextStyle SelectedWord= TextStyle(color: Colors.white,fontSize: 20,);
// TextStyle defaultword= TextStyle(color: Colors.white70,fontSize: 20,);
// Color SelectedIcon= Color(0xFF00B0FF);
//
//
//
//
// class CustomizedDrawer extends StatefulWidget {
//   @override
//   _CustomizedDrawerState createState() => _CustomizedDrawerState();
// }
//
// class _CustomizedDrawerState extends State<CustomizedDrawer> {
//   double totalwidth=250;
//   double minwidth=70;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: totalwidth,
//       color: Colors.black,
//
//         child: Column(
//           children: [
//                 //// for the avatar and the name ===>
//                 Row(
//                   children:[
//
//         Container(
//                   decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                     image: DecorationImage(
//                         image: ExactAssetImage('assets/hr.jpg'),
//                         fit: BoxFit.fill
//                     ),
//                   )),
//                   SizedBox(width: 4,),
//                   Text('Mariem',  style: TextStyle(fontSize: 16,)), // --------------------HR'S NAME
//         ],
//     ),
//
//
//                 //// pages to go to ===>
//                 ListView(
//                 children: [
//                 ListTiles('My Account', Icons.person, (){Navigator.pushNamed(context, '/profile');}),
//                 ListTiles('Products', Icons.shopping_bag_outlined, (){}), // data of all products and their ratings
//                 ListTiles('Sales men', Icons.assignment_ind_rounded, (){}), // data of all sales men and their ratings
//                 ListTiles('Delivery men', Icons.delivery_dining, (){}), // data of all delivery men and their ratings
//                 ListTiles('Complaints', Icons.article_rounded, (){Navigator.pushNamed(context, '/complaints');}),
//                 ListTiles('Sign out', Icons.logout, (){}), // go to the sign_in page
//                 //SizedBox(height: 20,),
//                 IconButton(icon: Icon(Icons.arrow_back_outlined, ), color: Colors.white, iconSize: 30, onPressed: () {Navigator.pop(context);},)
//                 ]),
//               ],
//             ),
//
//     );
//   }
// }
//
//
//
// class ListTiles extends StatelessWidget {
//   String text;
//   IconData icon;
//   Function ontap;
//
//   ListTiles(this.text, this.icon, this.ontap);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: InkWell(
//         onTap: ontap,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Icon(icon, size: 20, color: Colors.grey,),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                       text,
//                       style: defaultword
//                   )
//
//                   ),
//
//               ],
//             ),
//             Icon(Icons.arrow_right),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
// //
// //
// //
// //
// //
// // ////////////////////------------------lasttt
// // // child: Drawer(
// // // child: ListView(
// // // children: [
// // // DrawerHeader(
// // // decoration:BoxDecoration(
// // // gradient: LinearGradient( colors: <Color> [
// // // Colors.indigo[400],
// // // Colors.purple[200],
// // // ])
// // // ) ,
// // //
// // // child: Container(
// // // child: Column(
// // // children:[
// // // Container(
// // // width: 100,
// // // height: 100,
// // // decoration: BoxDecoration(
// // // shape: BoxShape.circle,
// // // image: DecorationImage(
// // // image: ExactAssetImage('assets/hr.jpg'),
// // // fit: BoxFit.fill
// // // ),
// // // )),
// // // SizedBox(height: 4,),
// // // Text('Mariem',  style: TextStyle(fontSize: 16,)), // ----------------------------HR'S NAME
// // // ],
// // //
// // // )
// // // )
// // // ),
// // //
// // //
// // // ListTiles('My Account', Icons.person, (){Navigator.pushNamed(context, '/profile');}),
// // // ListTiles('Products', Icons.shopping_bag_outlined, (){}), // data of all products and their ratings
// // // ListTiles('Sales men', Icons.assignment_ind_rounded, (){}), // data of all sales men and their ratings
// // // ListTiles('Delivery men', Icons.delivery_dining, (){}), // data of all delivery men and their ratings
// // // ListTiles('Complaints', Icons.article_rounded, (){Navigator.pushNamed(context, '/complaints');}),
// // // ListTiles('Sign out', Icons.logout, (){}), // go to the sign_in page
// // //
// // // SizedBox(height: 50,),
// // //
// // // Container(
// // // decoration: BoxDecoration(
// // // shape: BoxShape.circle,
// // // color: Colors.grey[300],
// // // ),
// // // child: IconButton(icon: Icon(Icons.close_rounded, ), onPressed: () {Navigator.pop(context);},)
// // // )
// // //
// // //
// // // ]),
// // // ),
// // // )
// // // ;
// // // }
// // // }
// // //
// // //
// // //
// // // class ListTiles extends StatelessWidget {
// // //   String text;
// // //   IconData icon;
// // //   Function ontap;
// // //
// // //   ListTiles(this.text, this.icon, this.ontap);
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Padding(
// // //       padding: const EdgeInsets.all(8.0),
// // //       child: InkWell(
// // //         onTap: ontap,
// // //         child: Row(
// // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //           children: [
// // //             Row(
// // //               children: [
// // //                 Icon(icon, size: 20,),
// // //                 Padding(
// // //                   padding: const EdgeInsets.all(8.0),
// // //                   child: Text(
// // //                       text,
// // //                       style: TextStyle(
// // //                         fontSize: 20,
// // //                         //color: Colors.white,
// // //                       )
// // //
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //             Icon(Icons.arrow_right),
// // //
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
