import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/constants.dart';
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
