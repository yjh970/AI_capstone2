
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/components/custom_suffix_icon.dart';
import 'package:final_project/components/default_button.dart';
import 'package:final_project/components/form_error.dart';
import 'package:final_project/screens/sign_in/sign_in_screen.dart';
import 'package:final_project/components/bottom_nav.bar.dart';
import 'package:final_project/screens/senior/components/body.dart';
import 'package:flutter/material.dart';
import 'package:final_project/constants.dart';

import 'package:final_project/enums.dart';

class SeniorAdd extends StatelessWidget {

  final nameController = TextEditingController();
  final seniorController = TextEditingController();
  final meetingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            title: Text("미팅 추가")),
        bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height:30,
                  child: Center(
                      child: Text('미팅 제목',
                      style: TextStyle(
                        color:kPrimaryColor
                      ),
                      )
                  )
              ),
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintText: '미팅 제목을 입력하세요.')
                ),
              Container(
                  height:30,
                  child: Center(
                      child: Text('강사 소개',
                          style: TextStyle(
                          color:kPrimaryColor
                      ),)
                  )
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
                        child: new TextField(
                          controller: seniorController,
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
              Container(
                  height:30,
                  child: Center(
                      child: Text('미팅 소개',
                        style: TextStyle(
                            color:kPrimaryColor
                        ),)
                  )
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
                    child: new TextField(
                      controller: meetingController,
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

              Container(
                  height:30,

              ),
              DefaultButton(
                  text: '작성 완료',
                  press: () =>
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(content: Text('미팅이 추가되었습니다.'));
                          }
                      )),

            ],
          ),


        )
    );
  }
}