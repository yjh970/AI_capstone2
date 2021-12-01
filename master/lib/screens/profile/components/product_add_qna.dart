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
import 'package:final_project/services/productQnaDatabase.dart';
import 'package:final_project/services/productReviewDatabase.dart';
import 'package:flutter/material.dart';
import 'package:final_project/constants.dart';
import 'package:intl/intl.dart';

import 'package:final_project/enums.dart';

class ProductAddQna extends StatefulWidget {
  final String productTitle;
  const ProductAddQna  ({ Key? key, required this.productTitle }): super(key: key);



  @override
  State<ProductAddQna> createState() => _ProductAddQna();
}

class _ProductAddQna extends State<ProductAddQna> {
  TextEditingController? _questionController;

  String? question;

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
    _questionController = TextEditingController();
  }

  void _addQuestionDialog(BuildContext context) {
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
        "질문 등록 확인",
        style: TextStyle(fontSize: 20),
      ),
      content: Text(
        "해당 질문이 정상적으로 등록되었습니다!",
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
        appBar: AppBar(title: Text("질문 등록")),
        bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildQuestionField(),
              SizedBox(height: 30),
              FormError(errors: errors),
              SizedBox(height: 40),
              DefaultButton(
                  text: '작성 완료',
                  press: () async {
                    var collection =
                    FirebaseFirestore.instance.collection('qnas');
                    var docSnapshot =
                    await collection.doc(_auth.getCurrentUser()).get();
                    DateTime now = DateTime.now();
                    String date = DateFormat('kk:mm:ss \n EEE d MMM').format(now);

                    String question =
                        _questionController!.text;
                    String id = _auth.getCurrentUser();
                    print(question);
                    print(id);

                    await QnaDatabaseService(title: widget.productTitle).updateQnaData(
                        id,
                        question,
                        date);

                    _addQuestionDialog(context);
                  }),
            ],
          ),
        ));
  }



  Column buildQuestionField() {
    return Column(
      children: [
        Container(
          height: 30,
          child: Center(
            child: Text(
              '질문 등록',
              style: TextStyle(color: kPrimaryColor),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        TextFormField(
          controller: _questionController,
          keyboardType: TextInputType.text,
          onSaved: (newValue) => question = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kQuestionNullError);
            }
            print(value);
            return null;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kQuestionNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: '질문',
            hintText: "시니어에게 물어볼 질문을 입력해주세요.",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ],
    );
  }
}
