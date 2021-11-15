// import 'package:final_project/models/Cart.dart';
// import 'package:final_project/models/Favorite.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:final_project/screens/details/components/body.dart';
//
//
//
// class ProfileFavorite extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("즐겨찾기"),
//       ),
//       body: Consumer<Favorite>(
//         builder: (BuildContext context, Favorite favorite, Widget? child){
//           return Column(
//             children: <Widget>[
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: favorite.productFavorite.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     if (favorite.productFavorite.isEmpty) {
//                       return Text('no products in cart');
//                     }
//                     final item = favorite.productFavorite[index];
//                     return ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: AssetImage(item.images[0]),
//                       ),
//                       title: Text(item.title, style: TextStyle(
//                         fontSize: 20,
//                       ),),
//                       subtitle: Text('가격: ${item.price.toString()} 원'),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
