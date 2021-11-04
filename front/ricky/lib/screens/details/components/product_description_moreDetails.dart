import 'package:final_project/models/Product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductDescriptionMoreDetails extends StatefulWidget {
  const ProductDescriptionMoreDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductDescriptionMoreDetailsState createState() =>
      _ProductDescriptionMoreDetailsState();
}

class _ProductDescriptionMoreDetailsState extends State<ProductDescriptionMoreDetails> {
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    final maxLines = isReadMore ? 100 : 2;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '멘토소개\n',
              style: TextStyle(fontSize: 20, color: Colors.black,
                  decoration: TextDecoration.underline),
              textAlign: TextAlign.end,
            ),
          ),
          Text(
            widget.product.meeting_description,
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
