import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/models/cart_item.dart';
import 'package:final_project/models/favorite_item.dart';
import 'package:final_project/screens/details/details_screen.dart';
import 'package:final_project/services/auth.dart';
import 'package:final_project/services/cartService.dart';
import 'package:final_project/services/favoriteService.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:final_project/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_project/screens/details/components/body.dart';

class ProfileFavorite extends StatefulWidget {
  @override
  State<ProfileFavorite> createState() => _ProfileFavoriteState();
}

class _ProfileFavoriteState extends State<ProfileFavorite> {
  FirebaseFirestore? _instance;

  @override
  Widget build(BuildContext context) {
    ProductSelectionService proSelection = Provider.of<ProductSelectionService>(context, listen: false);
    ProductService proService = Provider.of<ProductService>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("즐겨찾기"),
        ),
        body: Consumer<FavoriteService>(
            builder: (context, favorite, child) {
              List<Widget> favoriteItems = [];
              if (favorite.items.length > 0) {
                favorite.items.forEach((FavoriteItem item) {
                  Product itemProduct = (item.product as Product);
                  favoriteItems.add(
                      GestureDetector(
                        onTap: (){
                          proSelection.selectedProduct = itemProduct;
                          Navigator.pushNamed(context, DetailsScreen.routeName);
                        },
                        child: Container(
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
                          child: Column(children: favoriteItems),
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
