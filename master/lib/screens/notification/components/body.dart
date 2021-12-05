
import 'package:final_project/models/Product.dart';
import 'package:final_project/models/cart_item.dart';
import 'package:final_project/screens/details/components/top_rounded_container.dart';
import 'package:final_project/screens/notification/components/notificationContainer.dart';
import 'package:final_project/screens/profile/components/cartContainer.dart';
import 'package:final_project/services/cartService.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Body extends StatefulWidget {
  Product? product;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    CartService cService =
    Provider.of<CartService>(context, listen: false);
    List<CartItem> cart = cService.getProductCart();
    print(cart);

    return Container(
      child: Column(

          children: [
            if(cart.length != 0)...[
              for (int i = 0; i < cart.length; i++)

                Column(
                    children: [
                      NotificationContainer(
                        title: cart[i].title,
                        link: cart[i].link,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ]
                ),
            ],
            if (cart.isEmpty == true) ...[
              TopRoundedContainer(
                  height: 100,
                  color: Colors.white,
                  child: Text(
                    "새로운 알림이 없습니다.", style: TextStyle(fontSize: 30),)
              ),
            ],
          ]
      ),
    );



  }
}
