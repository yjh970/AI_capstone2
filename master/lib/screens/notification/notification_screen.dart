import 'package:final_project/components/bottom_nav.bar.dart';
import 'package:final_project/models/cart_item.dart';
import 'package:final_project/screens/details/components/top_rounded_container.dart';
import 'package:final_project/screens/notification/components/body.dart';
import 'package:final_project/screens/notification/components/custom_app_bar_notifications.dart';
import 'package:final_project/screens/profile/components/cartContainer.dart';
import 'package:final_project/services/cartService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../enums.dart';
import 'components/notificationContainer.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = '/notification';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {

    CartService cService =
    Provider.of<CartService>(context, listen: false);
    List<CartItem> cart = cService.getProductCart();
    print(cart);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBarNotifications(),
      ),
      body:Container(
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
                      "수강내역이 비어있습니다.", style: TextStyle(fontSize: 30),)
                ),
              ],
            ]
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.notification),
    );
  }
}
