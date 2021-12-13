import 'package:final_project/components/bottom_nav.bar.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/screens/notification/components/body.dart';
import 'package:final_project/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../enums.dart';
import 'components/notification_menu.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static String routeName = '/notification';
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String userId = AuthService().getCurrentUser();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List _messageList = [];
  List _dateList = [];
  List _titleList = [];
  List _senderNameList = [];

  getMessage() async {
    FirebaseFirestore.instance
        .collection('message').where('receiver',isEqualTo: userId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _messageList.add(doc["contents"]);
        _titleList.add(doc["title"]);
        _senderNameList.add(doc["senderName"]);
        _dateList.add(doc["date"].toString());

      });
    });
  }

  Future<String> getTime = Future<String>.delayed(
      Duration(seconds: 2),
          () => 'Data Loaded',
  );


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessage();

      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
          title: Text('Alarm'),
        ),
        body:FutureBuilder(
            future: getTime,
            builder:(context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator(color: kPrimaryColor,));
              } else {
                return 
                  Container(
                    margin: EdgeInsets.all(20),
                      child:ListView(
                  children: [
                    for(var item in Iterable<int>.generate(_messageList.length).toList())
                      NotificationMenu(message: _messageList[item],
                      date: _dateList[item],
                      title: _titleList[item],
                      senderName: _senderNameList[item],)
                  ],
                ));
              }
            }
        ),


        );

  }
}
