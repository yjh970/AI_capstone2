import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/components/custom_suffix_icon.dart';
import 'package:final_project/components/default_button.dart';
import 'package:final_project/components/form_error.dart';
import 'package:final_project/screens/loading/loading_screen_home.dart';
import 'package:final_project/screens/profile/profile_screen.dart';
import 'package:final_project/screens/sign_in/sign_in_screen.dart';
import 'package:final_project/components/bottom_nav.bar.dart';
import 'package:final_project/screens/senior/components/body.dart';
import 'package:final_project/services/auth.dart';
import 'package:final_project/services/productDatabase.dart';
import 'package:final_project/services/productReviewDatabase.dart';
import 'package:flutter/material.dart';
import 'package:final_project/constants.dart';

import 'package:final_project/enums.dart';

class ProductAddRating extends StatefulWidget {
  final String productTitle;
  const ProductAddRating  ({ Key? key, required this.productTitle }): super(key: key);



  @override
  State<ProductAddRating> createState() => _ProductAddRating();
}

class _ProductAddRating extends State<ProductAddRating> {
  TextEditingController? _ratingTextController,
      _ratingController;

  String? ratingText;
  double? rating;

  final List<String?> errors = [];
  final AuthService _auth = AuthService();


  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController();
    _ratingTextController = TextEditingController();
  }

  void _addReviewDialog(BuildContext context) {
    // set up the buttons
    Widget okayButton = TextButton(
      child: Text("확인"),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, LoadingScreenHome.routeName);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "후기 추가 확인",
        style: TextStyle(fontSize: 20),
      ),
      content: Text(
        "해당 후기가 정상적으로 등록되었습니다!",
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
    return Scaffold(
        appBar: AppBar(title: Text("후기 등록")),
        bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildRatingField(),
              SizedBox(height: 30),
              buildRatingTextField(),
              SizedBox(height: 30),
              FormError(errors: errors),
              SizedBox(height: 40),
              DefaultButton(
                  text: '작성 완료',
                  press: () async {
                    var collection =
                    FirebaseFirestore.instance.collection('Accounts');
                    var docSnapshot =
                    await collection.doc(_auth.getCurrentUser()).get();
                    var data = docSnapshot.data();
                    // var id = data?['id'];

                    String reviewString =
                        _ratingTextController!.text;
                    double rating = double.parse(_ratingController!.text);
                    String id = _auth.getCurrentUser();
                    print(reviewString);
                    print(rating);
                    print(id);

                    await ReviewDatabaseService(title: widget.productTitle).updateReviewData(
                        id,
                        reviewString,
                        rating);

                    _addReviewDialog(context);
                  }),
            ],
          ),
        ));
  }




  Column buildRatingTextField() {
    return Column(
      children: [
        Container(
          height: 30,
          child: Center(
            child: Text(
              '후기 내용',
              style: TextStyle(color: kPrimaryColor),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        TextFormField(
          controller: _ratingTextController,
          onSaved: (newValue) => ratingText = newValue,
          onChanged: (value) {
            print(value);
            return null;
          },
          keyboardType: TextInputType.text,
          maxLines: null,
          decoration: new InputDecoration(
              border: InputBorder.none, hintText: '후기 내용을 작성해주세요.'),
        ),
      ],
    );
  }

  Column buildRatingField() {
    return Column(
      children: [
        Container(
          height: 30,
          child: Center(
            child: Text(
              '평점',
              style: TextStyle(color: kPrimaryColor),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        TextFormField(
          controller: _ratingController,
          keyboardType: TextInputType.phone,
          onSaved: (newValue) => rating = newValue as double?,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kRatingNullError);
            }
            print(value);
            return null;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kRatingNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: '평점',
            hintText: "5점 만점의 평점을 입력해주세요",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ],
    );
  }
}
