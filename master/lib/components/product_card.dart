import 'package:final_project/models/Favorite.dart';
import 'package:final_project/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../size_config.dart';
import 'default_button.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.product,
    required this.press,
  }) : super(key: key);

  final double width, aspectRatio;
  final Product product;
  final GestureTapCallback press;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  void _showInfoDialog(BuildContext context) {
    // set up the buttons
    Widget okayButton = TextButton(
      child: Text("확인"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "강의 즐겨찾기 추가",
        style: TextStyle(fontSize: 20),
      ),
      content: Text(
        "해당 강의 (${widget.product.title})가 정상적으로 즐겨찾기에 추가되었습니다!",
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        okayButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _showDeleteDialog(BuildContext context) {
    // set up the buttons
    Widget okayButton = TextButton(
      child: Text("확인"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "강의 즐겨찾기 삭제",
        style: TextStyle(fontSize: 20),
      ),
      content: Text(
        "해당 강의 (${widget.product.title})가 정상적으로 즐겨찾기에서 제거되었습니다!",
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        okayButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: widget.press,
        child: SizedBox(
          width: getProportionateScreenWidth(widget.width),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: widget.aspectRatio,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    widget.product.images[0],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.product.price}\원",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF7643)),
                  ),
                  Consumer<Favorite>(
                    builder: (context, item, child) => InkWell(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(6)),
                        width: getProportionateScreenWidth(28),
                        height: getProportionateScreenHeight(28),
                        decoration: BoxDecoration(
                          color: widget.product.isFavorite
                              ? Colors.red.withOpacity(0.15)
                              : Color(0xFFF5F6F9).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/Heart Icon_2.svg',
                          color: widget.product.isFavorite
                              ? Color(0xFFFF4848)
                              : Color(0xFFDBDEE4),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          widget.product.isFavorite =
                              !widget.product.isFavorite;
                          if (widget.product.isFavorite == true) {
                            _showInfoDialog(context);
                            item.addToFavorite(widget.product);
                          } else {
                            _showDeleteDialog(context);
                            item.removeFavorite(widget.product);
                          }
                        });
                      },
                    ),
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
