import 'package:flutter/material.dart';
import 'package:grocery_ui/models/cart_model.dart';
import 'package:provider/provider.dart';

class Cart_Page extends StatelessWidget {
  Cart_Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Shopping Cart",
          ),
        ),
        body: Consumer<Cart_Model>(
          builder: (context, provider, child) {
            return Column(
              children: [
                //user cart
                Text(
                  "Your Cart",
                ),

                //list of cart items
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.cart_items.length,
                    padding: EdgeInsets.all(12.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              provider.cart_items[index][2],
                              height: 36.0,
                            ),
                            title: Text(
                              provider.cart_items[index][0],
                            ),
                            subtitle: Text(
                              "\$ ${provider.cart_items[index][1].toString()}",
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Provider.of<Cart_Model>(context, listen: false)
                                    .remove_item_from_cart(index);
                              },
                              icon: Icon(
                                Icons.cancel,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                //total price + pay now button
                Padding(
                  padding: EdgeInsets.all(36.0),
                  child: Container(
                    padding: EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: TextStyle(
                                color: Colors.green[100],
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "\$ " + provider.calculate_total_price(),
                              style: TextStyle(
                                fontSize: 28.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Payment",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
