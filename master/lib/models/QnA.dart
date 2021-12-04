import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QnA{
  final String id;
  final String question;
  final String date;


  QnA({
    required this.id,
    required this.question,
    required this.date,
  });

  factory QnA.fromJson(Map<String, dynamic> json){

    return QnA(
      id: json['id'],
      question : json['question'],
      date: json['date'],
    );
  }
}
