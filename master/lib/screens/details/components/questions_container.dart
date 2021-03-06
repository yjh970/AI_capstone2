import 'package:flutter/material.dart';

class questionsContainer extends StatelessWidget {
  const questionsContainer({
    Key? key,
    required this.id,
    required this.question,
    required this.date,
  }) : super(key: key);

  final String? id;
  final String? question;
  final String? date;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      id!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                    SizedBox(
                      width: 5,
                    ),

                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  date!,
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  question!,
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // new Container(
                //   child: isReplied == true
                //       ? new Container(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               SvgPicture.asset(
                //                 'assets/icons/Lock.svg',
                //                 width: 30,
                //                 height: 20,
                //               ),
                //               SizedBox(
                //                 width: 5,
                //               ),
                //               Text(
                //                 '?????? ????????? ?????? ?????????????????????.',
                //                 style: TextStyle(fontSize: 13),
                //               ),
                //             ],
                //           ),
                //         )
                //       : new Container(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               SvgPicture.asset('assets/icons/Error.svg'),
                //               SizedBox(
                //                 width: 20,
                //               ),
                //               Text(
                //                 '????????? ?????? ???????????? ???????????????.',
                //                 style: TextStyle(fontSize: 13),
                //               ),
                //             ],
                //           ),
                //         ),
                // )
              ],
            ),
          ),
          // SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          // Text(
          //   isReplied ? "?????? ??????" : "?????? ?????????",
          //   style: TextStyle(
          //     color: kPrimaryColor,
          //   ),
          //   textAlign: TextAlign.right,
          // ),
        ],
      ),
    );
  }
}
