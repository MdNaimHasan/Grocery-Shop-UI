import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_ui/components/grocery_item.dart';
import 'package:grocery_ui/models/cart_model.dart';
import 'package:grocery_ui/pages/cart_page.dart';
import 'package:provider/provider.dart';

class Home_Page extends StatefulWidget {
  Home_Page({
    Key? key,
  }) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Cart_Page();
              }),
            );
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.shopping_bag,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 48,
            ),
            //good morning text
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Text(
                "Good morning",
              ),
            ),

            //Lets order fresh items for you
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold,
                  fontSize: 36.0,
                ),
              ),
            ),

            //divider
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),

            //fresh food items
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Text(
                "Fresh Items",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),

            //gridview
            Expanded(
              child: Consumer<Cart_Model>(
                builder: (context, value, child) {
                  return GridView.builder(
                    padding: EdgeInsets.all(12.0),
                    itemCount: value.shop_items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return Grocery_Item(
                        on_pressed: () {
                          value.add_item_to_cart(index);
                          //Provider.of<Cart_Model>(context, listen: false).add_item_to_cart(index);
                        },
                        item_name: value.shop_items[index][0],
                        item_price: value.shop_items[index][1],
                        item_image: value.shop_items[index][2],
                        background_color: value.shop_items[index][3],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
