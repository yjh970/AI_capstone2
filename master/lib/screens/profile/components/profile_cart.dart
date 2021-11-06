import 'package:final_project/models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_project/screens/details/components/body.dart';



class ProfileCart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("수강 내역"),
      ),
      body: Consumer<Cart>(
        builder: (BuildContext context, Cart cart, Widget? child){
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: cart.productCart.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (cart.productCart.isEmpty) {
                      return Text('no products in cart');
                    }
                    final item = cart.productCart[index];
                    return ListTile(
                      title: Text(item.title, style: TextStyle(
                        fontSize: 20,
                      ),),
                      subtitle: Text('cost: ${item.price.toString()}'),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
