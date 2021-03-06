
import 'package:final_project/models/Product.dart';
import 'package:final_project/models/Review.dart';
import 'package:final_project/screens/details/components/review_container.dart';
import 'package:final_project/screens/details/components/top_rounded_container.dart';
import 'package:final_project/services/product_review_service.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProductDescriptionRating extends StatefulWidget {
  ProductDescriptionRating({Key? key}) : super(key: key);

  Product? product;

  @override
  State<ProductDescriptionRating> createState() =>
      _ProductDescriptionRatingState();
}

class _ProductDescriptionRatingState extends State<ProductDescriptionRating> {
  @override
  Widget build(BuildContext context) {
    bool exists = false;
    ProductSelectionService proSelection =
        Provider.of<ProductSelectionService>(context, listen: false);
    widget.product = proSelection.selectedProduct;
    ProductReviewService revService =
        Provider.of<ProductReviewService>(context, listen: false);
    List<Review> reviews = revService.getProductReviews();
    print(reviews);

    // double averageRating =
    //     reviews.map((m) => m.rating).reduce((a, b) => a + b) / reviews.length;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),

      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '평점\n',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.underline),
              textAlign: TextAlign.end,
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/Star Icon.svg',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  if(reviews.length != 0)...[
                    Text(
                      (reviews.map((m) => m.rating).reduce((a, b) => a + b) / reviews.length).toStringAsFixed(1),
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ] else ...[
                    Text("0",  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                  ]
                ],
              ),

              const SizedBox(
                width: 10,
              ),
              Text(
                "/  5.0",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              if(reviews.length != 0)...[
                for (int i = 0; i < reviews.length; i++)
                  Column(
                      children: [
                        reviewContainer(
                          id: reviews[i].id,
                          review: reviews[i].reviewString,
                          score: reviews[i].rating,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ]
                  ),
              ],
              if (reviews.isEmpty == true) ...[
                TopRoundedContainer(
                  height: 100,
                  color: Colors.white,
                  child: Text("등록된 후기가 없습니다.", style: TextStyle(fontSize: 30),)
                ),
              ]
            ],
          )


        ],
      ),
    );
  }
}
