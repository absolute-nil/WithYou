// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:b2b_app/Models/Message.dart';
// import 'package:b2b_app/Widgets/ChatPageWidgets/chat_screen.dart';

// class FavouriteContacts extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 'Starred Sellers',
//                 style: TextStyle(
//                   color: Colors.blueGrey,
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 1.0,
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(
//                   Icons.more_horiz,
//                 ),
//                 iconSize: 30.0,
//                 color: Colors.blueGrey,
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ),
//         Container(
//           height: 110.0,
//           child: ListView.builder(
//             padding: EdgeInsets.only(left: 10.0),
//             scrollDirection: Axis.horizontal,
//             itemCount: favourites.length,
//             itemBuilder: (BuildContext context, int index) {
//               return GestureDetector(
//                 onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => ChatScreen(
//                       user: favourites[index],
//                     ),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       CircleAvatar(
//                         radius: 25.0,
//                         backgroundImage: AssetImage(favourites[index].imageUrl),
//                       ),
//                       SizedBox(height: 3.0),
//                       Text(
//                         favourites[index].name,
//                         style: TextStyle(
//                           color: Colors.blueGrey,
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
