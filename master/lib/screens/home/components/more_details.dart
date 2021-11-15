// import 'package:final_project/components/product_card.dart';
// import 'package:final_project/models/Product.dart';
// import 'package:final_project/screens/details/details_screen.dart';
// import 'package:flutter/material.dart';
//
// class MoreDetails extends StatelessWidget {
//   const MoreDetails({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("All Popular Meetings"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 200,
//               childAspectRatio: 1/ 1.5,
//               crossAxisSpacing: 20,
//               mainAxisSpacing: 20),
//           itemCount: demoProducts.length,
//           itemBuilder: (BuildContext context, index) {
//             if(demoProducts[index].isPopular == true)
//             return ProductCard(
//               product: demoProducts[index],
//               press: () => Navigator.pushNamed(
//                 context,
//                 DetailsScreen.routeName,
//                 arguments: ProductDetailsArgument(product: demoProducts[index]),
//               ),
//             );
//             return SizedBox.shrink();
//           },
//         ),
//       ),
//     );
//   }
// }
