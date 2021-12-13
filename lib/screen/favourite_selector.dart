// import 'package:flutter/material.dart';
// import 'package:teamapt/utility/config.dart';
//
// class FavouriteSelector extends StatefulWidget {
//   @override
//   _FavouriteSelectorState createState() => _FavouriteSelectorState();
// }
//
// class _FavouriteSelectorState extends State<FavouriteSelector> {
//   TextStyle style = TextStyle(
//       fontFamily: 'Montserrat',
//       fontSize: 15.0,
//       fontWeight: FontWeight.normal,
//       letterSpacing: 1.0,
//       color: Colors.blueGrey);
//   Config config = new Config();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 "To Take",
//                 style: TextStyle(
//                     fontFamily: 'Montserrat',
//                     fontSize: 15.0,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1.0,
//                     color: Color(0xFF0e333d)),
//               ),
//               Row(
//                 children: [
//                   Icon(Icons.add, size: 20, color: Colors.green),
//                   Text(
//                     "Add",
//                     style: TextStyle(
//                         fontFamily: 'Montserrat',
//                         fontSize: 12.0,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1.0,
//                         color: Colors.green),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Container(
//           height: 115,
//           child: ListView.builder(
//             padding: EdgeInsets.only(left: 10.0),
//             itemCount: config.favourite.length,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (BuildContext context, int index) {
//               return Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Column(
//                   children: <Widget>[
//                     CircleAvatar(
//                       radius: 35.0,
//                       backgroundImage:
//                           AssetImage(config.favourite[index].imageUrl),
//                     ),
//                     SizedBox(
//                       height: 6.0,
//                     ),
//                     Text(
//                       config.favourite[index].name,
//                       textAlign: TextAlign.center,
//                       style: style,
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         )
//       ],
//     );
//   }
// }
