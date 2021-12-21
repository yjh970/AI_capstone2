import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/models/favorite_item.dart';
import 'package:final_project/services/favoriteDatabase.dart';
import 'package:final_project/services/favoriteService.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:final_project/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../size_config.dart';
import 'default_button.dart';

class ProductCard extends StatefulWidget {

  Product? product;
  Function? onCardClick;

  ProductCard({this.product, this.onCardClick});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    FavoriteService favoriteService = Provider.of<FavoriteService>(context, listen: false);



    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: () {
          this.widget.onCardClick!();
        },
        child: SizedBox(
          width: getProportionateScreenWidth(140),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    this.widget.product!.image[0],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                this.widget.product!.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${this.widget.product!.price}\원",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF7643)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}