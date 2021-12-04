import 'package:final_project/models/Product.dart';
import 'package:final_project/models/QnA.dart';
import 'package:final_project/screens/details/components/questions_container.dart';
import 'package:final_project/screens/details/components/top_rounded_container.dart';
import 'package:final_project/services/product_qna_service.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDescriptionQnA extends StatefulWidget {
  ProductDescriptionQnA({Key? key})
      : super(key: key);
  Product? product;


  @override
  State<ProductDescriptionQnA> createState() => _ProductDescriptionQnAState();
}

class _ProductDescriptionQnAState extends State<ProductDescriptionQnA> {
  @override
  Widget build(BuildContext context) {
    ProductSelectionService proSelection =
    Provider.of<ProductSelectionService>(context, listen: false);
    widget.product = proSelection.selectedProduct;
    ProductQnAService qService =
    Provider.of<ProductQnAService>(context, listen: false);
    List<QnA> qnas = qService.getProductQnAs();
    print(qnas);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '질의응답\n',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decoration: TextDecoration.underline),
                textAlign: TextAlign.end,
              ),
            ),
            Column(
              children: [
                if(qnas.length != 0)...[
                  for (int i = 0; i < qnas.length; i++)
                    Column(
                        children: [
                          questionsContainer(
                            id: qnas[i].id,
                            question: qnas[i].question,
                            date: qnas[i].date,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ]
                    ),
                ],
                if (qnas.isEmpty == true) ...[
                  TopRoundedContainer(
                      height: 100,
                      color: Colors.white,
                      child: Text("등록된 질문이 없습니다.", style: TextStyle(fontSize: 30),)
                  ),
                ]
              ],
            ),
            // Column(
            //   children: [
            //     questionsContainer(
            //       id: "KimYoungSeo****",
            //       question: "다음 강의는 언제 올라오나요??",
            //       isReplied: true,
            //     ),
            //     const SizedBox(
            //       height: 30,
            //     ),
            //     questionsContainer(
            //       id: "HongKilDong****",
            //       question: "3페이지에 있는 내용은 어디서 찾을 수 있나요?",
            //       isReplied: false,
            //     ),
            //     const SizedBox(
            //       height: 30,
            //     ),
            //     questionsContainer(
            //       id: "LebronJames****",
            //       question: "강사님 다음 줌 회의는 언제 열리는건가요?",
            //       isReplied: true,
            //     ),
            //     const SizedBox(
            //       height: 30,
            //     ),
            //     questionsContainer(
            //       id: "MichaelJordan****",
            //       question: "강사님 질문을 미팅 시간에 해도 되나요?",
            //       isReplied: true,
            //     ),
            //     const SizedBox(
            //       height: 30,
            //     ),
            //     questionsContainer(
            //       id: "MichaelJordan****",
            //       question: "프로그래밍 언어 중 가장 관심받는 언어는 무엇인가요?",
            //       isReplied: false,
            //     ),
            //     const SizedBox(
            //       height: 30,
            //     ),
            //     questionsContainer(
            //       id: "MichaelJordan****",
            //       question: "코딩 테스트 통과를 위해 준비를 어떻게 해야할까요?",
            //       isReplied: false,
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
