import 'package:final_project/models/Product.dart';
import 'package:final_project/screens/details/components/review_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDescriptionRating extends StatelessWidget {
  const ProductDescriptionRating({
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
              Text(
                product.rating.toString(),
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
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
              reviewContainer(
                id: "KimYoungSeo****",
                review: "해당 강의를 듣고 해당 업무를 수행하는데 많은 도움을 받았습니다! 정말 좋은 강의에요~",
                score: 5.0,
              ),
              const SizedBox(height: 30,),
              reviewContainer(
                id: "HongKilDong****",
                review: "강의가 좋긴했지만 그렇게 도움이 되지는 않았던 것 같아요...",
                score: 4.3,
              ),
              const SizedBox(height: 30,),
              reviewContainer(
                id: "LebronJames****",
                review: "정말 좋은 강의입니다. 완전 강추!!!",
                score: 4.9,
              ),
              const SizedBox(height: 30,),
              reviewContainer(
                id: "MichaelJordan****",
                review: "이거를 안들으면 완전 손해입니다~ 꼭 들으세요!",
                score: 4.8,
              ),
              const SizedBox(height: 30,),
              reviewContainer(
                id: "MichaelJackson****",
                review: "완전 강의짱!",
                score: 4.7,
              ),
              const SizedBox(height: 30,),
              reviewContainer(
                id: "Psy****",
                review: "정말 유익하고 도움이 많이 되는 강의입니다!",
                score: 4.9,
              ),
            ],
          )
        ],
      ),
    );
  }
}
