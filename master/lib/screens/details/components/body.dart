import 'package:final_project/components/default_button.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/models/cart_item.dart';
import 'package:final_project/models/favorite_item.dart';
import 'package:final_project/screens/details/components/categories_tab_bar.dart';
import 'package:final_project/screens/details/components/product_description_meeting.dart';
import 'package:final_project/screens/details/components/product_description_mentor.dart';
import 'package:final_project/screens/details/components/product_description_qna.dart';
import 'package:final_project/screens/details/components/product_description_rating.dart';
import 'package:final_project/screens/details/components/product_images.dart';
import 'package:final_project/screens/details/components/top_rounded_container.dart';
import 'package:final_project/services/cartService.dart';
import 'package:final_project/services/favoriteService.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:final_project/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  Product? product;

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
    ProductSelectionService proSelection =
        Provider.of<ProductSelectionService>(context, listen: false);
    widget.product = proSelection.selectedProduct;
    CartService cartService = Provider.of<CartService>(context, listen: false);
    FavoriteService favoriteService = Provider.of<FavoriteService>(context, listen: false);

    void _addParticipateDialog(BuildContext context) {
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
          "해당 강의 (${widget.product!.title})가 정상적으로 수강완료되었습니다!",
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

    void _deleteParticipateDialog(BuildContext context) {
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
          "강의 수강 삭제",
          style: TextStyle(fontSize: 20),
        ),
        content: Text(
          "해당 강의 (${widget.product!.title})가 정상적으로 수강 목록에서 제거되었습니다!",
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

    void _addFavoriteDialog(BuildContext context) {
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
          "즐겨찾기 확인",
          style: TextStyle(fontSize: 20),
        ),
        content: Text(
          "해당 강의 (${widget.product!.title})가 정상적으로 즐겨찾기에 추가되었습니다!",
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

    void _deleteFavoriteDialog(BuildContext context) {
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
          "즐겨찾기 삭제",
          style: TextStyle(fontSize: 20),
        ),
        content: Text(
          "해당 강의 (${widget.product!.title})가 정상적으로 즐겨찾기에서 제거되었습니다!",
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

    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: widget.product!),
          Align(
            alignment: Alignment.centerRight,
            child: Consumer<FavoriteService>(
                builder: (context, favorite, child) {
                  Widget renderedButton;
                  if (favorite.isProductAddedToFavorite(this.widget.product) == false){
                    renderedButton = GestureDetector(
                      onTap: (){
                        print(favorite.isProductAddedToFavorite(this.widget.product));
                        favoriteService.add(context, FavoriteItem(product: this.widget.product));
                        _addFavoriteDialog(context);
                        print(favorite.isProductAddedToFavorite(this.widget.product));
                      }
                      ,
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                        width: getProportionateScreenWidth(64),
                        decoration: BoxDecoration(
                            color: Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: SvgPicture.asset(
                          'assets/icons/Heart Icon_2.svg',
                          color: Color(0xFFDBDEE4),
                        ),
                      ),
                    );
                  }
                  else{
                    renderedButton = GestureDetector(
                      onTap: (){
                        print(favorite.isProductAddedToFavorite(this.widget.product));
                        favoriteService.remove(context, FavoriteItem(product: this.widget.product));
                        _deleteFavoriteDialog(context);
                        print(favorite.isProductAddedToFavorite(this.widget.product));
                      },

                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                        width: getProportionateScreenWidth(64),
                        decoration: BoxDecoration(
                            color: Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: SvgPicture.asset(
                          'assets/icons/Heart Icon_2.svg',
                          color: Color(0xFFFF4848),
                        ),
                      ),
                    );
                  }
                  return renderedButton;
                }
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
                  title: Text(widget.product!.title),
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
                        product: widget.product!, key: meetingKey),
                    ProductDescriptionMentor(
                        product: widget.product!, key: mentorKey),
                    ProductDescriptionRating(
                        product: widget.product!, key: ratingKey),
                    ProductDescriptionQnA(
                      product: widget.product!,
                      key: questionsKey,
                    )
                  ]),
                )
              ],
            ),
          ),
          Consumer<CartService>(
            builder: (context, cart, child) {
              Widget renderedButton;
              if (cart.isProductAddedToCart(widget.product) == false) {
                renderedButton = DefaultButton(
                  text: "Participate",
                  press: () {
                    print(cart.isProductAddedToCart(widget.product));
                    _addParticipateDialog(context);
                    cartService.add(context, CartItem(product: widget.product));
                    print(cart.isProductAddedToCart(widget.product));
                  },
                );
              } else {
                renderedButton = DefaultButton(
                  text: "Delete",
                  press: () {
                    print(cart.isProductAddedToCart(widget.product));
                    _deleteParticipateDialog(context);
                    cartService.remove(
                        context, CartItem(product: widget.product));
                    print(cart.isProductAddedToCart(widget.product));
                  },
                );
              }
              return renderedButton;
              //
            },
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
