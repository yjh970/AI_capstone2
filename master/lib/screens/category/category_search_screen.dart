import 'package:final_project/components/bottom_nav.bar.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:final_project/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:final_project/screens/home/components/event_banner.dart';
import 'package:final_project/components/product_card.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/screens/details/details_screen.dart';
import 'package:provider/provider.dart';

import '../../enums.dart';


class CategorySearchScreen extends StatelessWidget {

  const CategorySearchScreen({
    required this.category
  });

  final String category;




  @override
  Widget build(BuildContext context) {
    ProductSelectionService proSelection = Provider.of<ProductSelectionService>(context, listen: false);
    ProductService proService = Provider.of<ProductService>(context, listen: false);
    List <Product> products = proService.getProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        child:Column(
          children:<Widget>[
            EventBanner(),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){},
                      child: Container(
                        margin:EdgeInsets.fromLTRB(20, 5, 5, 5),
                        height:40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF5F6F9)
                        ),
                        child:Center(
                            child: Text('공기업')),
                  )

                ),
                  GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin:EdgeInsets.all(5),
                        height:40,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF5F6F9)
                        ),
                        child:Center(
                            child: Text('대기업')),
                      )

                  ),GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin:EdgeInsets.all(5),
                        height:40,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF5F6F9)
                        ),
                        child:Center(
                            child: Text('중견기업')),
                      )

                  ),GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin:EdgeInsets.all(5),
                        height:40,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF5F6F9)
                        ),
                        child:Center(
                            child: Text('중소기업')),
                      )
                  ),
                ],
            ),
            new Expanded(
              child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this would produce 2 rows.
                crossAxisCount: 2,
                childAspectRatio: 3/4,
                // Generate 100 Widgets that display their index in the List
                children: <Widget>[
                  ...List.generate(
                    3,
                        (index) {
                      if (products[index].isPopular == true) //Product.dart에서 isPopular = false라고 지정하면 안나옴.
                        return ProductCard(
                          product: products[index],
                          onCardClick: () {
                            proSelection.selectedProduct = products[index];
                            Navigator.pushNamed(context, DetailsScreen.routeName);
                          }
                        );
                        return SizedBox.shrink();
                    },
                  ),
                  ],
              ),
            )

          ],

        )
      ),




      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.category),
    );
  }
}
