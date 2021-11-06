import 'package:final_project/components/default_button.dart';
import 'package:final_project/components/rounded_icon_button.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/models/Cart.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/screens/details/components/categories_tab_bar.dart';
import 'package:final_project/screens/details/components/product_description.dart';
import 'package:final_project/screens/details/components/product_description_meeting.dart';
import 'package:final_project/screens/details/components/product_description_mentor.dart';
import 'package:final_project/screens/details/components/product_description_qna.dart';
import 'package:final_project/screens/details/components/product_description_rating.dart';
import 'package:final_project/screens/details/components/product_images.dart';
import 'package:final_project/screens/details/components/top_rounded_container.dart';
import 'package:final_project/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  final meetingKey = new GlobalKey();
  final mentorKey = new GlobalKey();
  final ratingKey = new GlobalKey();
  final questionsKey = new GlobalKey();

  double meetingHeight = 0;
  double mentorHeight = 0;
  double ratingHeight = 0;
  double questionHeight = 0;
  bool isTapToScroll = false;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _onScroll();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          "강의 수강 확인",
          style: TextStyle(fontSize: 20),
        ),
        content: Text(
          "해당 강의 (${widget.product.title})가 정상적으로 수강완료되었습니다!",
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

    void _showConfirmDialog(BuildContext context) {
      // set up the buttons
      Widget cancelButton = TextButton(
        child: Text("아니요"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      Widget continueButton = TextButton(
          child: Text("네"),
          onPressed: () {
            Navigator.of(context).pop();
            _showInfoDialog(context);
          });

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text(
          "강의 수강 확인",
          style: TextStyle(fontSize: 20),
        ),
        content: Text(
          "해당 강의 ( ${widget.product.title} -- ${widget.product.name} )을(를) 수강하시겠습니까?",
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          cancelButton,
          continueButton,
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

    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: widget.product),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              width: getProportionateScreenWidth(64),
              decoration: BoxDecoration(
                  color: widget.product.isFavorite
                      ? Color(0xFFFFE6E6)
                      : Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: SvgPicture.asset(
                'assets/icons/Heart Icon_2.svg',
                color: widget.product.isFavorite
                    ? Color(0xFFFF4848)
                    : Color(0xFFDBDEE4),
              ),
            ),
          ),
          TopRoundedContainer(
            height: 580,
            color: Colors.white,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  titleSpacing: 20,
                  title: Text(widget.product.title),
                  automaticallyImplyLeading: false,
                ),
                SliverAppBar(
                  titleSpacing: 10,
                  pinned: true,
                  title: CategoriesTabBar(
                    tabController: _tabController,
                    press: _onTapToScroll,
                  ),
                  automaticallyImplyLeading: false,
                ),
                SliverList(
                  delegate: SliverChildListDelegate.fixed([
                    ProductDescriptionMeeting(
                        product: widget.product, key: meetingKey),
                    ProductDescriptionMentor(
                        product: widget.product, key: mentorKey),
                    ProductDescriptionRating(
                        product: widget.product, key: ratingKey),
                    ProductDescriptionQnA(
                      product: widget.product,
                      key: questionsKey,
                    )
                  ]),
                )
              ],
            ),
          ),
          Consumer<Cart>(
            builder: (context, item, child) => TopRoundedContainer(
              height: 150,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.15,
                  right: SizeConfig.screenWidth * 0.15,
                  top: getProportionateScreenWidth(20),
                  bottom: getProportionateScreenWidth(20),
                ),
                child: DefaultButton(
                  text: "Participate",
                  press: () {
                    _showConfirmDialog(context);
                    item.addToCart(widget.product);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onScroll() {
    if (isTapToScroll) return;

    if (meetingKey.currentContext != null) {
      meetingHeight = meetingKey.currentContext!.size!.height;
    }
    if (mentorKey.currentContext != null) {
      mentorHeight = mentorKey.currentContext!.size!.height;
    }
    if (ratingKey.currentContext != null) {
      ratingHeight = ratingKey.currentContext!.size!.height;
    }
    if (questionsKey.currentContext != null) {
      questionHeight = questionsKey.currentContext!.size!.height;
    }

    if (_scrollController.offset <= meetingHeight) {
      _tabController.animateTo(0,
          duration: const Duration(milliseconds: 0), curve: Curves.linear);
    } else if (_scrollController.offset > meetingHeight &&
        _scrollController.offset < meetingHeight + mentorHeight) {
      _tabController.animateTo(1,
          duration: const Duration(milliseconds: 0), curve: Curves.linear);
    } else if (_scrollController.offset > meetingHeight + mentorHeight &&
        _scrollController.offset <
            meetingHeight + mentorHeight + ratingHeight) {
      _tabController.animateTo(2,
          duration: const Duration(milliseconds: 0), curve: Curves.linear);
    } else {
      _tabController.animateTo(3,
          duration: const Duration(milliseconds: 0), curve: Curves.linear);
    }
  }

  void _onTapToScroll(int index) async {
    var keys = [meetingKey, mentorKey, ratingKey, questionsKey];
    var previousIndex = _tabController.previousIndex;

    isTapToScroll = true;

    if (index == 0) {
      await _scrollController.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    } else {
      if (previousIndex < index) {
        for (var i = previousIndex; i <= index; i++) {
          await _scrollController.position.ensureVisible(
            keys[i].currentContext!.findRenderObject()!,
            duration: Duration(milliseconds: 100),
            curve: Curves.linear,
          );
        }
      } else {
        for (var i = previousIndex; i >= index; i--) {
          await _scrollController.position.ensureVisible(
            keys[i].currentContext!.findRenderObject()!,
            duration: Duration(milliseconds: 100),
            curve: Curves.linear,
          );
        }
      }
    }
    isTapToScroll = false;
  }
}
