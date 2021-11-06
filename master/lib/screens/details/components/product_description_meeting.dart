import 'package:final_project/models/Product.dart';
import 'package:flutter/material.dart';


class ProductDescriptionMeeting extends StatelessWidget {
  const ProductDescriptionMeeting({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '강의소개\n',
              style: TextStyle(fontSize: 20, color: Colors.black,
                  decoration: TextDecoration.underline),
              textAlign: TextAlign.end,
            ),
          ),
          Text(
            product.meeting_description,
            maxLines: 1000,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

