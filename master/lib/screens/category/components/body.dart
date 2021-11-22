//
// import 'package:flutter/material.dart';
// import 'package:final_project/screens/category/components/category_menu.dart';
//
//
// class Body extends StatelessWidget {
//   List categoryList = ['IT/SW','MD/상품기획','PM','SCM','건설/기계/기술','경영/사무/행정','광고/홍보','구매','금융/은행/보험'
//   ,'기획','디자인','마케팅','미디어','생산/제조','연구개발','영업/고객상담','유통/물류/무역','의료','인사총무','전문특수직','품질','항공'];
//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//         primary: false,
//         padding : const EdgeInsets.all(10),
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//         crossAxisCount: 2,
//         childAspectRatio: 3/1,
//         children: <Widget>[
//           for(var item in categoryList)
//             CategoryMenu(
//               text:item,
//             ),
//       ],
//
//     );
//
//
//
//   }
// }
