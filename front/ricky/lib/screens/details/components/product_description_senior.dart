import 'package:final_project/models/Product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductDescriptionSenior extends StatefulWidget {
  const ProductDescriptionSenior({Key? key, required this.product,})
      : super(key: key);

  final Product product;

  @override
  _ProductDescriptionSeniorState createState() =>
      _ProductDescriptionSeniorState();
}

class _ProductDescriptionSeniorState extends State<ProductDescriptionSenior> {
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    final maxLines = isReadMore ? 100 : 2;
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          Text(
            "aAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
            "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
            "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
          GestureDetector(
            onTap: () => setState(() => isReadMore = !isReadMore),
            child: Row(
              children: [
                Text(
                  isReadMore ? "See less Detail" : "See more Detail",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
