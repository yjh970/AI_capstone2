import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/models/Cart.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/models/cart_item.dart';
import 'package:final_project/services/auth.dart';
import 'package:final_project/services/cartService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_project/screens/details/components/body.dart';

class ProfileCart extends StatefulWidget {
  @override
  State<ProfileCart> createState() => _ProfileCartState();
}

class _ProfileCartState extends State<ProfileCart> {
  FirebaseFirestore? _instance;

  @override
  Widget build(BuildContext context) {
    // AuthService authService = Provider.of<AuthService>(context, listen: false);
    //
    // _instance = FirebaseFirestore.instance;
    // FirebaseFirestore.instance.collection('cart').doc(authService.getCurrentUser())
    // .get().then((DocumentSnapshot documentSnapshot){
    //   if(documentSnapshot.exists){
    //     print('Document data: ${documentSnapshot.data()}');
    //   }
    //
    // });
    //
    // // return Scaffold();
    // Stream<DocumentSnapshot> _usersStream = _instance!
    //     .collection('cart')
    //     .doc(authService.getCurrentUser())
    //     .snapshots();
    //
    // return StreamBuilder<QuerySnapshot>(
    //   stream: _usersStream,
    //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
    //     if(snapshot.connectionState == ConnectionState.active)
    //       {
    //         return ListView(
    //           children: snapshot.data!.documents.map((DocumentSnapshot document){
    //             return ListTile(
    //               title: Text(document['title']),
    //               subtitle: Text(document['name']),
    //             );
    //           }).toList(),
    //         );
    //
    //       }
    //   }
    // );

    // return StreamBuilder<DocumentSnapshot>(
    //     stream: _usersStream,
    //     builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    //       return ListView(
    //         children: snapshot.data!.map((DocumentSnapshot document) {
    //           Map<String, dynamic> data =
    //               document.data()! as Map<String, String>;
    //           return ListTile(
    //             title: Text(data['title']),
    //             subtitle: Text(data['name']),
    //           );
    //         }).toList(),
    //       );
    //     }
    return Scaffold(
      appBar: AppBar(
        title: Text("수강 내역"),
      ),
      body: Consumer<CartService>(
          builder: (context, cart, child) {
            List<Widget> cartItems = [];
            if (cart.items.length > 0) {
              cart.items.forEach((CartItem item) {
                Product itemProduct = (item.product as Product);
                cartItems.add(
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset.zero
                            )
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(itemProduct.image[0],
                                width: 50, height: 50, fit: BoxFit.cover),
                          ),
                          SizedBox(width: 20,),
                          Expanded(child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(itemProduct.title,
                                  style: TextStyle(
                                      color: kPrimaryColor
                                  )
                              ),
                              Text(itemProduct.name,
                                  style: TextStyle(
                                      color: kPrimaryColor
                                  )
                              ),
                            ],
                          ),)
                        ],
                      ),
                    )
                );
              });

              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(children: cartItems),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Scaffold();
            }
          }
      )
    );
  }
}
