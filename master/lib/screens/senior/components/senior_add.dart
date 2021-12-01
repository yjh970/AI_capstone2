import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/components/default_button.dart';
import 'package:final_project/components/form_error.dart';
import 'package:final_project/screens/loading/loading_screen_home.dart';
import 'package:final_project/components/bottom_nav.bar.dart';
import 'package:final_project/services/auth.dart';
import 'package:final_project/services/productDatabase.dart';
import 'package:flutter/material.dart';
import 'package:final_project/constants.dart';

import 'package:final_project/enums.dart';

class SeniorAdd extends StatefulWidget {
  @override
  State<SeniorAdd> createState() => _SeniorAddState();
}

class _SeniorAddState extends State<SeniorAdd> {
  TextEditingController? _meetingDescriptionController,
      _mentorDescriptionController,
      _priceController,
      _meetingTitleController,
  _meetingImage1Controller,
  _meetingImage2Controller;
  //Accounts에서 이름 정보 받아올지 직접 입력하게할지 고민

  String? meetingDescription;
  String? mentorDescription;
  int? price;
  String? meetingTitle;
  List<String> meetingImage = ['image1','image2'];
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
    _meetingImage1Controller = TextEditingController();
    _meetingImage2Controller = TextEditingController();
    _meetingTitleController =  TextEditingController();
    _mentorDescriptionController =  TextEditingController();
    _meetingDescriptionController =  TextEditingController();
    _priceController =  TextEditingController();
  }

  void _addMeetingDialog(BuildContext context) {
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
        "미팅 추가 확인",
        style: TextStyle(fontSize: 20),
      ),
      content: Text(
        "해당 미팅이 정상적으로 등록되었습니다!",
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
        appBar: AppBar(title: Text("미팅 추가")),
        bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildMeetingTitleField(),
              SizedBox(height: 30),
              buildMeetingDescriptionField(),
              SizedBox(height: 30),
              buildMentorDescriptionField(),
              SizedBox(height: 30),
              buildMeetingPriceField(),
              SizedBox(height: 30),
              buildMeetingImageField1(),
              SizedBox(height: 30),
              buildMeetingImageField2(),
              SizedBox(height: 30,),
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
                    var name = data?['name'];

                    String meetingDescription =
                        _meetingDescriptionController!.text;
                    String mentorDescription =
                        _mentorDescriptionController!.text;
                    int price = int.parse(_priceController!.text);
                    String meetingTitle = _meetingTitleController!.text;
                    String id = _auth.getCurrentUser();
                    meetingImage[0] = _meetingImage1Controller!.text;
                    meetingImage[1] = _meetingImage2Controller!.text;
                    String mentorName = name;
                    print(mentorDescription);
                    print(mentorDescription);
                    print(price);
                    print(meetingTitle);
                    print(id);
                    print(mentorName);
                    print(meetingImage);
                    print(meetingImage[0]);
                    print(meetingImage[1]);

                    await ProductDatabaseService().updateProductData(
                        meetingTitle,
                        mentorName,
                        meetingDescription,
                        mentorDescription,
                        price,
                        id,
                        meetingImage);

                    _addMeetingDialog(context);
                  }),
            ],
          ),
        ));
  }

  Column buildMeetingImageField1() {
    return Column(
      children: [
        Container(
          height: 30,
          child: Center(
            child: Text(
              '미팅 이미지1',
              style: TextStyle(color: kPrimaryColor),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        TextFormField(
          controller: _meetingImage1Controller,
          keyboardType: TextInputType.text,
    //       onSaved: (newValue) {
    //         setState(() {
    //           meetingImage[0] = newValue!;
    //         });
    // },
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kImageNullError);
            }
            print(value);
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kImageNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: '사진1',
            hintText: "사진1의 주소를 입력해주세요",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ],
    );
  }

  Column buildMeetingImageField2() {
    return Column(
      children: [
        Container(
          height: 30,
          child: Center(
            child: Text(
              '미팅 이미지2',
              style: TextStyle(color: kPrimaryColor),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        TextFormField(
          controller: _meetingImage2Controller,
          keyboardType: TextInputType.text,
          // onSaved: (newValue) {
          //   setState(() {
          //     meetingImage[1] = newValue!;
          //   });
          // },
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kImageNullError);
            }
            print(value);
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kImageNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: '사진2',
            hintText: "사진2의 주소를 입력해주세요",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ],
    );
  }


  Column buildMeetingDescriptionField() {
    return Column(
      children: [
        Container(
          height: 30,
          child: Center(
            child: Text(
              '미팅 소개',
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
        ),
        Container(
          height: 200,
          child: new ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200.0,
            ),
            child: new Scrollbar(
              child: new SingleChildScrollView(
                scrollDirection: Axis.vertical,
                reverse: true,
                child: SizedBox(
                  height: 200.0,
                  child: new TextFormField(
                    controller: _meetingDescriptionController,
                    onSaved: (newValue) => meetingDescription = newValue,
                    onChanged: (value) {
                      print(value);
                    },
                    maxLines: 100,
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: '미팅 소개를 입력하세요.',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column buildMentorDescriptionField() {
    return Column(
      children: [
        Container(
          height: 30,
          child: Center(
            child: Text(
              '강사 소개',
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
        ),
        Container(
          height: 200,
          child: new ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200.0,
            ),
            child: new Scrollbar(
              child: new SingleChildScrollView(
                scrollDirection: Axis.vertical,
                reverse: true,
                child: SizedBox(
                  height: 200.0,
                  child: new TextFormField(
                    controller: _mentorDescriptionController,
                    onSaved: (newValue) => mentorDescription = newValue,
                    onChanged: (value) {
                      print(value);
                    },
                    maxLines: 100,
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: '강사 소개를 입력하세요.',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column buildMeetingTitleField() {
    return Column(
      children: [
        Container(
          height: 30,
          child: Center(
            child: Text(
              '미팅 제목',
              style: TextStyle(color: kPrimaryColor),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        TextFormField(
          controller: _meetingTitleController,
          onSaved: (newValue) => meetingTitle = newValue,
          onChanged: (value) {
            print(value);
            return null;
          },
          keyboardType: TextInputType.text,
          maxLines: null,
          decoration: new InputDecoration(
              border: InputBorder.none, hintText: '미팅 제목을 입력하세요.'),
        ),
      ],
    );
  }

  Column buildMeetingPriceField() {
    return Column(
      children: [
        Container(
          height: 30,
          child: Center(
            child: Text(
              '미팅 가격',
              style: TextStyle(color: kPrimaryColor),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        TextFormField(
          controller: _priceController,
          keyboardType: TextInputType.phone,
          onSaved: (newValue) => price = newValue as int?,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPriceNullError);
            }
            print(value);
            return null;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kPriceNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: '가격',
            hintText: "미팅의 가격을 입력해주세요.",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixText: '원',
          ),
        ),
      ],
    );
  }
}
