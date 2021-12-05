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
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
