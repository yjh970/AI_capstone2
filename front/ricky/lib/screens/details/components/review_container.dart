import 'package:flutter/material.dart';

import '../../../constants.dart';


class reviewContainer extends StatelessWidget {
  const reviewContainer(
      {Key? key, required this.id, required this.review, required this.score})
      : super(key: key);

  final String? id;
  final String? review;
  final double? score;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  id!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  review!,
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.6),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.1),
          Text(
            "${score} / 5.0",
            style: TextStyle(
              color: kPrimaryColor,
            ),
          )
        ],
      ),
    );

  }
}
