import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/models/cart_item.dart';
import 'package:final_project/screens/details/components/top_rounded_container.dart';
import 'package:final_project/screens/details/details_screen.dart';
import 'package:final_project/screens/profile/components/product_add_qna.dart';
import 'package:final_project/screens/profile/components/product_add_rating.dart';
import 'package:final_project/services/cartService.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cartContainer.dart';

class ProfileCart extends StatefulWidget {
  Product? product;
  @override
  State<ProfileCart> createState() => _ProfileCartState();
}

class _ProfileCartState extends State<ProfileCart> {
  FirebaseFirestore? _instance;

  @override
  Widget build(BuildContext context) {
    ProductSelectionService proSelection =
    Provider.of<ProductSelectionService>(context, listen: false);
    widget.product = proSelection.selectedProduct;
    CartService cService =
    Provider.of<CartService>(context, listen: false);
    List<CartItem> cart = cService.getProductCart();

    return Scaffold(
        appBar: AppBar(
          title: Text("수강 내역"),
        ),
        body: Container(
          child: Column(
              children: [
                if(cart.length != 0)...[
                  for (int i = 0; i < cart.length; i++)

                    Column(
                        children: [
                          CartContainer(
                            title: cart[i].title,
                            name: cart[i].name,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ]
                    ),
                ],
                if (cart.isEmpty == true) ...[
                  TopRoundedContainer(
                      height: 100,
                      color: Colors.white,
                      child: Text(
                        "수강내역이 비어있습니다.", style: TextStyle(fontSize: 30),)
                  ),
                ],
              ]
          ),
        )
    );
  }
}
//       Consumer<CartService>(builder: (context, cart, child) {
//         List<Widget> cartItems = [];
//         if (cart.items.length > 0) {
//           cart.items.forEach((CartItem item) {
//             Product itemProduct = (item.product as Product);
//             cartItems.add(GestureDetector(
//               onTap: () {
//                 proSelection.selectedProduct = itemProduct;
//                 Navigator.pushNamed(context, DetailsScreen.routeName);
//               },
//               child: Container(
//                 margin: EdgeInsets.all(10),
//                 padding: EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(50),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 10,
//                           offset: Offset.zero)
//                     ]),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ClipOval(
//                       child: Image.asset(itemProduct.image[0],
//                           width: 50, height: 50, fit: BoxFit.cover),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Expanded(
//                       child: Row(
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Flexible(
//                                 child: Text(itemProduct.title,
//                                     style: TextStyle(color: kPrimaryColor)),
//                               ),
//                               Text(itemProduct.name,
//                                   style: TextStyle(color: kPrimaryColor)),
//                             ],
//                           ),
//                           SizedBox(width: 10),
//                           Column(
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   print("Tapped");
//                                   Navigator.of(context).push(
//                                     MaterialPageRoute(
//                                       builder: (BuildContext context) {
//                                         return ProductAddRating(
//                                             productTitle: itemProduct.title);
//                                       },
//                                     ),
//                                   );
//                                 },
//                                 child: Container(
//                                   margin: EdgeInsets.all(10),
//                                   padding: EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(30),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             color:
//                                                 Colors.black.withOpacity(0.1),
//                                             blurRadius: 10,
//                                             offset: Offset.zero)
//                                       ]),
//                                   child: Text(
//                                     "후기 등록",
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   print("Tapped");
//                                   Navigator.of(context).push(
//                                     MaterialPageRoute(
//                                       builder: (BuildContext context) {
//                                         return ProductAddQna(
//                                             productTitle: itemProduct.title);
//                                       },
//                                     ),
//                                   );
//                                 },
//                                 child: Container(
//                                   margin: EdgeInsets.all(10),
//                                   padding: EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(30),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             color:
//                                                 Colors.black.withOpacity(0.1),
//                                             blurRadius: 10,
//                                             offset: Offset.zero)
//                                       ]),
//                                   child: Text(
//                                     "질문하기 ",
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ));
//           });
//
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               SizedBox(height: 20),
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   child: SingleChildScrollView(
//                     child: Column(children: cartItems),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         } else {
//           return Scaffold();
//         }
//       }));
// }
// }
