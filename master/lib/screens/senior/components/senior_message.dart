import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/components/default_button.dart';
import 'package:final_project/components/form_error.dart';
import 'package:final_project/screens/loading/loading_screen_home.dart';
import 'package:final_project/components/bottom_nav.bar.dart';
import 'package:final_project/services/auth.dart';
import 'package:final_project/services/productDatabase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_project/constants.dart';
import 'package:intl/intl.dart';
import 'package:final_project/enums.dart';

class SeniorMessage extends StatefulWidget {
  @override
  State<SeniorMessage> createState() => _SeniorMessageState();
}

class _SeniorMessageState extends State<SeniorMessage> {
  TextEditingController? _meetingDescriptionController;
  String? meetingDescription;
  String? meetingTitle;
  String userId = AuthService().getCurrentUser();
  String? userName;
  List _cartList = [];
  List _productList = [];
  List _IdList = [];
  var tempMap = Map<String,dynamic>();

  getinformation(){
    getUserName();
    getMeetingName();
    getMeetingName2();
    getJuniorID();
    getJuniorID2();

  }

  getUserName()async{
    FirebaseFirestore.instance
        .collection('Accounts').doc(userId)
        .get()
        .then((DocumentSnapshot ds) {
          userName = ds['name'];
    });
  }

  getMeetingName(){
    FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _productList.add(doc['Products']);

      });
    });
  }

  void getMeetingName2() {
    for (var item in _productList){
        for (var item2 in item){
          if(item2['name']==userName){
            meetingTitle = item2['title'];

          }
        }
      }
  }


  getJuniorID() async {
    FirebaseFirestore.instance
        .collection('cart')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        tempMap = {doc.reference.id:doc['cartProduct']};
        _cartList.add(tempMap);
      });
    });
  }

  void getJuniorID2() {
    for (var item in _cartList){
      for (var item2 in item.values) {
        for (var item3 in item2){
          if(item3['title']==meetingTitle){
            _IdList.add(item.keys.toString().substring(1,item.keys.toString().length-1));
            print(item.keys.toString().substring(1,item.keys.toString().length-1));
          }
        }
      }
      }
  }

  void addMessage(){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd kk:mm').format(now);

    for (var id in _IdList)
    FirebaseFirestore.instance.collection('message').add({
      'contents':_meetingDescriptionController!.text,
      'receiver':id.toString(),
      'sender':userId,
      'title':meetingTitle,
      'senderName':userName,
      'date':formattedDate
    });
  }

  Future<String> getTime = Future<String>.delayed(
    Duration(seconds: 2),
        () => 'Data Loaded',
  );


  @override
  void initState() {
    super.initState();
    _meetingDescriptionController = TextEditingController();
    List _cartList = [];
    List _productList = [];
    List _IdList = [];
    var tempMap = Map<String,dynamic>();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder(
        future: getTime,
        builder: (context, AsyncSnapshot snapshot) {
          getinformation();
    if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(color: kPrimaryColor,)
        );
    }
    else{
      return Scaffold(
          appBar: AppBar(title: Text("메시지 전송")),
          body: SingleChildScrollView(
              child: Column(
                  children: [
                    buildMeetingDescriptionField(),
                    SizedBox(height: 30),
                    DefaultButton(
                      text: '전송하기',
                      press:(){
                        addMessage();

                        Navigator.pop(context);
                        _showDialog();
                      },
                    ),

                  ]
              )
          )
      );

    }

    }
    ));
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("${userName}님",style: TextStyle(fontSize: 20),),
          content: new Text("${meetingTitle}의 수강생들에게\n정상적으로 메시지가 전송되었습니다.",style: TextStyle(fontSize: 15)),
          actions: <Widget>[
            new Container(
              height: 20,
              child:
              GestureDetector(
                child:Text("Close",style: TextStyle(fontSize: 15)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        );
      },
    );
  }


  Column buildMeetingDescriptionField() {
    return Column(
      children: [
        Container(
          height: 30,
          child: Center(
            child: Text(
              '메시지 작성',
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
                      hintText: '수강생에게 보낼 메시지를 입력하세요.',
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
}