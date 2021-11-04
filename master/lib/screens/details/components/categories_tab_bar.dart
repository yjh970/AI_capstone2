import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';

class CategoriesTabBar extends StatelessWidget {
  const CategoriesTabBar(
      {Key? key, required this.tabController, required this.press})
      : super(key: key);
  final TabController? tabController;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: press as void Function(int)?,
      controller: tabController,
      indicatorColor: Colors.black,
      labelColor: kPrimaryColor,
      indicatorWeight: 2.0,
      unselectedLabelColor: kPrimaryColor.withOpacity(0.2),
      labelPadding: EdgeInsets.symmetric(horizontal: 10),
      tabs: <Widget>[
        Tab(
          child: Text(
            '미팅소개',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Tab(
          child: Text(
            '강사 소개',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Tab(
          child: Text(
            '후기',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Q&A',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
