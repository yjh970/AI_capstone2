

import 'package:final_project/screens/category/category_search_screen.dart';
import 'package:flutter/material.dart';


import '../../../constants.dart';

class CategoryMenu extends StatelessWidget {
  const CategoryMenu({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        child:Center(
          child: Text(this.text)),
            color: Color(0xFFF5F6F9),

    ),
        onTap:(){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategorySearchScreen( category: this.text)));
        //Navigator.pushNamed(context, CategorySearchScreen.routeName);
        }
    );

  }
}
